#!/bin/bash

cd ~/FlexFlutter

cat > codemagic.yaml << 'EOF'
workflows:
  flex-yemen-android:
    name: Flex Yemen Android
    instance_type: mac_mini_m1
    max_build_duration: 30
    environment:
      flutter: stable
    scripts:
      - name: Create Flutter project structure
        script: |
          mkdir -p /tmp/my_code
          cp -r lib /tmp/my_code/
          cp pubspec.yaml /tmp/my_code/
          
          cd /tmp
          flutter create flex_yemen_new --org com.flexyemen
          
          rm -f /tmp/my_code/lib/main.dart
          rm -f /tmp/my_code/lib/app.dart
          
          echo "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CmltcG9ydCAnYXBwLmRhcnQnOwoKdm9pZCBtYWluKCkgPT4gcnVuQXBwKGNvbnN0IEZsZXhZZW1lbkFwcCgpKTsK" | base64 -d > /tmp/flex_yemen_new/lib/main.dart
          
          echo "aW1wb3J0ICdwYWNrYWdlOmZsdXR0ZXIvbWF0ZXJpYWwuZGFydCc7CmltcG9ydCAnbmF2aWdhdGlvbi9tYWluX25hdmlnYXRpb24uZGFydCc7CmltcG9ydCAndGhlbWUvYXBwX3RoZW1lLmRhcnQnOwoKY2xhc3MgRmxleFllbWVuQXBwIGV4dGVuZHMgU3RhdGVmdWxXaWRnZXQgewogIGNvbnN0IEZsZXhZZW1lbkFwcCh7c3VwZXIua2V5fSk7CgogIEBvdmVycmlkZQogIFN0YXRlPEZsZXhZZW1lbkFwcD4gY3JlYXRlU3RhdGUoKSA9PiBfRmxleFllbWVuQXBwU3RhdGUoKTsKfQoKY2xhc3MgX0ZsZXhZZW1lbkFwcFN0YXRlIGV4dGVuZHMgU3RhdGU8RmxleFllbWVuQXBwPiB7CiAgYm9vbCBpc0RhcmtNb2RlID0gdHJ1ZTsKICBpbnQgY2FydENvdW50ID0gMDsKCiAgdm9pZCB0b2dnbGVUaGVtZSgpID0+IHNldFN0YXRlKCgpID0+IGlzRGFya01vZGUgPSAhaXNEYXJrTW9kZSk7CiAgdm9pZCBhZGRUb0NhcnQoKSA9PiBzZXRTdGF0ZSgoKSA9PiBjYXJ0Q291bnQrKyk7CgogIEBvdmVycmlkZQogIFdpZGdldCBidWlsZChCdWlsZENvbnRleHQgY29udGV4dCkgewogICAgcmV0dXJuIE1hdGVyaWFsQXBwKAogICAgICBkZWJ1Z1Nob3dDaGVja2VkTW9kZUJhbm5lcjogZmFsc2UsCiAgICAgIHRoZW1lOiBBcHBUaGVtZS5saWdodFRoZW1lLAogICAgICBkYXJrVGhlbWU6IEFwcFRoZW1lLmRhcmtUaGVtZSwKICAgICAgdGhlbWVNb2RlOiBpc0RhcmtNb2RlID8gVGhlbWVNb2RlLmRhcmsgOiBUaGVtZU1vZGUubGlnaHQsCiAgICAgIGhvbWU6IE1haW5OYXZpZ2F0aW9uKAogICAgICAgIGlzRGFya01vZGU6IGlzRGFya01vZGUsCiAgICAgICAgY2FydENvdW50OiBjYXJ0Q291bnQsCiAgICAgICAgb25UaGVtZVRvZ2dsZTogdG9nZ2xlVGhlbWUsCiAgICAgICAgb25BZGRUb0NhcnQ6IGFkZFRvQ2FydCwKICAgICAgKSwKICAgICk7CiAgfQp9Cg==" | base64 -d > /tmp/flex_yemen_new/lib/app.dart
          
          cp -r /tmp/my_code/lib/* /tmp/flex_yemen_new/lib/ 2>/dev/null || true
          cp /tmp/my_code/pubspec.yaml /tmp/flex_yemen_new/
          
          rm -rf $CM_BUILD_DIR/*
          cp -r /tmp/flex_yemen_new/* $CM_BUILD_DIR/
      
      - name: Get dependencies
        script: flutter pub get
      
      - name: Build APK
        script: flutter build apk --release
    
    artifacts:
      - build/**/outputs/**/*.apk
EOF

git add codemagic.yaml
git commit -m "🔧 Fix: Use base64 for main.dart and app.dart"
git push origin main

echo "✅ تم!"

