#!/bin/bash

# Face Emotion Recognition Project Setup Script

echo "=================================="
echo "Face Emotion Recognition Setup"
echo "=================================="
echo ""

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p emotion_recognition_project/{models,utils,config,assets}
cd emotion_recognition_project

# Create empty files
echo "📄 Creating files..."
touch utils/__init__.py config/__init__.py
touch models/.gitkeep assets/.gitkeep

echo "✅ Directory structure created!"
echo ""

# Create Python files (You'll need to copy the content from artifacts)
echo "⚠️  Please copy the following files from the artifacts:"
echo "   - app.py"
echo "   - requirements.txt"
echo "   - README.md"
echo "   - config/config.py"
echo "   - config/__init__.py"
echo "   - utils/__init__.py"
echo "   - utils/face_detector.py"
echo "   - utils/emotion_predictor.py"
echo "   - utils/visualization.py"
echo ""

# Install dependencies
read -p "📦 Do you want to install dependencies now? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing Python packages..."
    pip install -r requirements.txt
    echo "✅ Dependencies installed!"
fi
echo ""

# Download model
read -p "📥 Do you want to download the model now? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Downloading model from HuggingFace..."
    python3 << EOF
from huggingface_hub import hf_hub_download
print("Downloading model...")
hf_hub_download(
    repo_id="ElenaRyumina/face_emotion_recognition",
    filename="FER_static_ResNet50_AffectNet.pt",
    local_dir="./models"
)
print("✅ Model downloaded successfully!")
EOF
fi
echo ""

echo "=================================="
echo "✨ Setup Complete!"
echo "=================================="
echo ""
echo "To run the application:"
echo "  cd emotion_recognition_project"
echo "  streamlit run app.py"
echo ""
echo "📚 For more information, see README.md"
echo ""