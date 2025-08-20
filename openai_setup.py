#!/usr/bin/env python3
"""
OpenAI API Setup and Testing Script
For "The Serpent's Sentence" project

This script demonstrates how to securely use the OpenAI API
with environment variables and provides basic functionality testing.
"""

import os
from dotenv import load_dotenv
from openai import OpenAI

def setup_openai_client():
    """
    Set up OpenAI client with API key from environment variables.
    Returns configured OpenAI client or None if setup fails.
    """
    # Load environment variables from .env file
    load_dotenv()
    
    # Get API key from environment
    api_key = os.getenv('OPENAI_API_KEY')
    
    if not api_key or api_key == 'your_api_key_here':
        print("❌ OpenAI API key not found!")
        print("Please:")
        print("1. Get your API key from: https://platform.openai.com/api-keys")
        print("2. Edit the .env file and replace 'your_api_key_here' with your actual key")
        return None
    
    # Initialize OpenAI client
    try:
        client = OpenAI(api_key=api_key)
        print("✅ OpenAI client initialized successfully!")
        return client
    except Exception as e:
        print(f"❌ Error initializing OpenAI client: {e}")
        return None

def test_api_connection(client):
    """Test the API connection with a simple request."""
    try:
        # Test with a simple completion
        response = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": "Say 'API connection successful!' if you receive this message."}
            ],
            max_tokens=50
        )
        
        message = response.choices[0].message.content
        print(f"✅ API Test Response: {message}")
        return True
        
    except Exception as e:
        print(f"❌ API test failed: {e}")
        return False

def list_available_models(client):
    """List available models for your API key."""
    try:
        models = client.models.list()
        print("\n📋 Available Models:")
        for model in models.data:
            if 'gpt' in model.id.lower():
                print(f"  • {model.id}")
        return True
    except Exception as e:
        print(f"❌ Error listing models: {e}")
        return False

def consciousness_example(client):
    """
    Example function that uses the API for consciousness-related research,
    aligned with The Serpent's Sentence project themes.
    """
    try:
        response = client.chat.completions.create(
            model="gpt-4",
            messages=[
                {
                    "role": "system", 
                    "content": "You are a research assistant specializing in consciousness studies, neuroscience, and the philosophy of mind. Provide academic-level insights."
                },
                {
                    "role": "user", 
                    "content": "In the context of language as a 'cognitive fall' from unified consciousness, how might pre-linguistic awareness differ from symbolic thought? Keep response under 150 words."
                }
            ],
            max_tokens=200
        )
        
        insight = response.choices[0].message.content
        print(f"\n🧠 Consciousness Research Example:\n{insight}")
        return True
        
    except Exception as e:
        print(f"❌ Research example failed: {e}")
        return False

if __name__ == "__main__":
    print("🔧 Setting up OpenAI API for The Serpent's Sentence project...\n")
    
    # Initialize client
    client = setup_openai_client()
    
    if client:
        # Run tests
        print("\n🧪 Testing API connection...")
        if test_api_connection(client):
            print("\n📊 Listing available models...")
            list_available_models(client)
            
            print("\n🔬 Running consciousness research example...")
            consciousness_example(client)
        
        print("\n✨ Setup complete! You can now use the OpenAI API in your project.")
        print("💡 Remember: Keep your API key secure and never commit it to version control.")
    else:
        print("\n⚠️  Setup incomplete. Please add your API key to the .env file.")
