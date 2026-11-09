# Run in a new demo directory; replace identity and remote placeholders.
sudo apt update
sudo apt install git -y
git --version
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
mkdir GitDemo
cd GitDemo
git init
echo "Hello Git" > file.txt
git status
git add file.txt
git commit -m "Initial commit"
git branch -M main
# First create an empty repository on GitHub.
git remote add origin https://github.com/USERNAME/REPO.git
git remote -v
git push -u origin main
git checkout -b feature
echo "New feature" > feature.txt
git add feature.txt
git commit -m "Add feature"
git checkout main
git merge feature
git push
