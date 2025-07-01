# Getting Commits from the Kickstarter Project

## Initial Setup

When you fork the kickstart.nvim project and want to keep track of updates from the original repository, follow these steps:

### 1. Add the upstream remote
```bash
git remote add upstream https://github.com/nvim-lua/kickstart.nvim
```

### 2. Create a local tracking branch for upstream
```bash
git fetch upstream
git checkout -b upstream upstream/master
```

This creates a local branch named `upstream` that tracks the `upstream/master` branch from the original kickstart.nvim repository.

### 3. Verify the setup
```bash
git remote -v
git branch -vv
```

You should see:
- `upstream` remote pointing to the original kickstart.nvim repo
- Local `upstream` branch tracking `upstream/master`

## Importing Specific Commits

### 1. Update your upstream branch
```bash
git checkout upstream
git pull
```

### 2. Cherry-pick commits into your main branch
```bash
git checkout master
git cherry-pick <commit_hash>
```

This way your repository "knows" about the commits from the main project and you can selectively import the changes you want while maintaining your own customizations.

### 3. View available commits
To see what commits are available from upstream:
```bash
git log upstream --oneline
```

To see commits that are in upstream but not in your master:
```bash
git log master..upstream --oneline
```