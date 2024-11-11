#!/bin/bash

# Create the /app directory if it doesn't exist
mkdir -p /app

# Download the ProfitTrailer.zip file to /app
curl -o /app/ProfitTrailer.zip https://download.profittrailer.com/ProfitTrailer.zip

# Check if the download was successful
if [ ! -f /app/ProfitTrailer.zip ]; then
  echo "Download failed. Exiting."
  exit 1
fi

# Always create 2 instances: /app/pt1 and /app/pt2
for i in 1 2; do
  # Create the subfolder for the instance
  mkdir -p /app/pt$i

  # Extract only ProfitTrailer.jar to the subfolder
  unzip -j /app/ProfitTrailer.zip ProfitTrailer.jar -d /app/pt$i
done

echo "Setup complete. ProfitTrailer.jar extracted to /app/pt1 and /app/pt2."
