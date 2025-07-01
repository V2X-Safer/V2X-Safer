#!/bin/bash

# 默认宽度
WIN_WIDTH=960
# 默认高度
DEFAULT_HEIGHT=1080

# 已处理窗口列表
declare -A processed

echo "[+] Watching for windows..."

while true; do
  # 获取所有窗口 ID 和标题
  wmctrl -l | while read -r WIN_ID DESKTOP HOSTNAME TITLE; do

    # 跳过已处理窗口
    if [[ -n "${processed[$WIN_ID]}" ]]; then
      continue
    fi

    # 位置坐标与高度默认值
    POS_X=""
    POS_Y=""
    HEIGHT="$DEFAULT_HEIGHT"

    # 判断标题内容并设定位置与高度
    if [[ "$TITLE" == *"CarlaUE4"* ]]; then
      POS_X=960
      POS_Y=0
    elif [[ "$TITLE" =~ ^[0-9]{3}$ ]]; then
      POS_X=960
      POS_Y=0
      WIN_WIDTH=360
      HEIGHT=360 # 特例：三位数字窗口高度设为 400
    elif [[ "$TITLE" == *"the bev"* ]]; then
      POS_X=960
      POS_Y=460
    elif [[ "$TITLE" == *"camera"* ]]; then
      POS_X=960
      POS_Y=800
    else
      continue # 不匹配的窗口跳过
    fi

    # 移动与调整窗口
    echo "[+] Moving window '$TITLE' ($WIN_ID) to ($POS_X, $POS_Y) with height $HEIGHT"
    xdotool windowmove "$WIN_ID" "$POS_X" "$POS_Y"
    xdotool windowsize "$WIN_ID" "$WIN_WIDTH" "$HEIGHT"

    processed[$WIN_ID]=1
  done

  sleep 1
done
