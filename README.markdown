# Real Life Xcode File and Project Templates

- maintainer: Matt Nunogawa
- version: 2

Better Xcode file and project templates.

### Install

We can't use `git clone`, because /Developer isn't empty.  The following is roughly equivalent to `git clone`

    cd /Developer
    git init
    git remote add origin git@github.com:amattn/RealLifeXcodeTemplates.git
    git config branch.master.remote origin
    git config branch.master.merge refs/heads/master
    git pull

### Update

    cd /Developer
    git pull
    
Or all on one line from anywhere:

    pushd /Developer; git pull; popd

### File Templates:

- commonly used methods stubbed out
- Headerdoc comments

### Project templates:

App template types:

- Navigvation based app
    - with and without CoreData
- View based app
    - iPad
    - iPhone

Features:

- Improved Project layout
- Static analysis on by default
- Unit tests
- Refactored Core Data stack (when appropriate)
