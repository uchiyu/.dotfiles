#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"

model="$(echo "$input" | jq -r '.model.display_name // "Claude"')"
cost="$(echo "$input" | jq -r '.cost.total_cost_usd // 0')"
ctx_used="$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)"
ctx_left="$(echo "$input" | jq -r '.context_window.remaining_percentage // 0' | cut -d. -f1)"
five_used="$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // 0' | cut -d. -f1)"
seven_used="$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // 0' | cut -d. -f1)"
five_reset="$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // 0')"
seven_reset="$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // 0')"

now="$(date +%s)"

fmt_left() {
  local target="$1"
  if [ "$target" = "0" ] || [ "$target" -le "$now" ]; then
    echo "--"
    return
  fi
  local diff=$((target - now))
  local h=$((diff / 3600))
  local m=$(((diff % 3600) / 60))
  if [ "$h" -gt 0 ]; then
    echo "${h}h ${m}m"
  else
    echo "${m}m"
  fi
}

bar() {
  local pct="${1:-0}"
  local width=20
  local fill=$((pct * width / 100))
  local empty=$((width - fill))
  printf "["
  printf "%0.s#" $(seq 1 "$fill")
  printf "%0.s-" $(seq 1 "$empty")
  printf "]"
}

five_left="$(fmt_left "$five_reset")"
seven_left="$(fmt_left "$seven_reset")"

transcript="$(echo "$input" | jq -r '.transcript_path // ""')"
title=""
if [ -n "$transcript" ] && [ -f "$transcript" ]; then
  title="$(grep '"type":"ai-title"' "$transcript" 2>/dev/null | tail -1 | jq -r '.aiTitle // ""' 2>/dev/null)"
fi

# 1行目
if [ -n "$title" ]; then
  printf "📝 %s\n" "$title"
fi

# 2行目
printf "🤖 %s | 💰 $%s | ctx %s%% %s\n" \
  "$model" "$cost" "$ctx_used" "$(bar "$ctx_used")"

# 2行目
printf "⏳ 5h %s%% (%s left) | 📅 7d %s%% (%s left) | remain %s%%\n" \
  "$five_used" "$five_left" "$seven_used" "$seven_left" "$ctx_left"
