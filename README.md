Each repo is added as a git submodule, and each directory leads to the solutions repo of the given contributor. Entries that are not shown as links are hosted on platforms other than Github (e.g., Gitlab), and links to those should be part of the last commit message (see `ptrfrncsmrph` for example).

## Cloning this repo WITH submodules

Stackoverflow questions [1](https://stackoverflow.com/questions/3796927/how-to-git-clone-including-submodules) and [2](https://stackoverflow.com/questions/16728866/how-to-only-update-specific-git-submodules) are very helpful, but the gist is:

+ clone **all** repos:  
  `git clone --recurse-submodules https://github.com/sac-fp/HaskellBook-solutions.git`

+ clone **specific** repo(s):  
  `git clone --recurse-submodules=ptrfrncsmrph --recurse-submodules=txels https://github.com/sac-fp/HaskellBook-solutions.git`

See more at section `--recurse-submodules` in `git help clone`.

## How to add your solutions repo

From the command line:

  0. Fork this repo
  1. `git clone https://github.com/<your-github-username>/HaskellBook-solutions.git`
  2. `git checkout -b add-solution`
  3. `git submodule add <url-of-your-repo> <your-github-username>`
  4. Stage and commit your changes
  5. `git push origin add-solution`
  6. [Create a pull request](https://help.github.com/articles/creating-a-pull-request/)

## Helpful `git` resources:

  + [Don't be afraid to commit](http://dont-be-afraid-to-commit.readthedocs.io/en/latest/git/commandlinegit.html)
  + [The Github Blog - Working with submodules](https://blog.github.com/2016-02-01-working-with-submodules/)
  + [Stackoverflow - Add git submodule with a different name](https://stackoverflow.com/questions/26215625/name-option-doesnt-work-with-git-submodule-add-command)
  + [Stackoverflow - How do I remove a git submodule?](https://stackoverflow.com/questions/1260748/how-do-i-remove-a-submodule#answer-1260982)

A list of solutions are available at https://github.com/CarlosMChica/haskell-book-readers-exercises but it hasn't been updated for a couple months now.
