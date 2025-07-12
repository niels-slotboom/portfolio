#!/usr/bin/env bash
set -euo pipefail

INPUT_DIR="picture-processing/input"
OUTPUT_DIR="picture-processing/output"
LOW_DIR="$OUTPUT_DIR/low"

mkdir -p "$INPUT_DIR"
mkdir -p "$OUTPUT_DIR"
mkdir -p "$LOW_DIR"

counter=1

find "$INPUT_DIR" -type f \( -iname "*.png" -o -iname "*.jpeg" -o -iname "*.jpg" -o -iname "*.tif" -o -iname "*.tiff" \) | sort | while read -r img; do
    out_img="$OUTPUT_DIR/${counter}.jpg"
    low_img="$LOW_DIR/${counter}.jpg"

    echo "Processing $img -> $out_img and $low_img"

    convert "$img" -quality 90 "$out_img"
    convert "$out_img" -resize 1800x1800\> -quality 85 "$low_img"

    counter=$((counter + 1))
done

echo "Done processing all images."
