#! /bin/bash

echo $(which mogenerator)

# Conjure a name for the generated files
PROJECT_DIR="./$1"
echo project $PROJECT_DIR
OUT_DIR="$PROJECT_DIR/mogenerated"
echo out $OUT_DIR
DATA_MODEL="$PROJECT_DIR/$2.xcdatamodeld"
echo model $DATA_MODEL

mogenerator --model "$DATA_MODEL" \
  --swift \
  --output-dir "$OUT_DIR"
  
ls "$OUT_DIR"
