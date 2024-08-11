# Makefile for deploying Flutter web app to GitHub Pages

# Update These Variables
# BASE_HREF = '/Jitendra_kohar/'  #/Jitendra_kohar/ represent thename of repository
GITHUB_REPO = git@github.com:TarishAhmed/TarishAhmed.github.io.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
  @echo "Clean existing repository..." #print the log
  flutter clean  #flutter command

  @echo "Getting packages..."  #print the log
  flutter pub get #flutter command

  @echo "Building for web..."  #print the log
  flutter build web --base-href $(BASE_HREF) --release   #this command using the Base_Href in your index.htm and base_href value is getting from the above variable

  @echo "Deploying to git repository"
  cd build/web && \
  git init && \
  git add . && \
  git commit -m "Deploy Version $(BUILD_VERSION)" && \
  git branch -M main && \
  git remote add origin $(GITHUB_REPO) && \
  git push -u --force origin main

  cd ../..
  @echo "🟢 Finished Deploy"

.PHONY: deploy-web