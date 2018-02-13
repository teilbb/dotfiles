```
git add --all
git commit -m 'commit'
git push
```
```
git fetch origin master:tmp
git diff tmp 
git merge tmp
git branch -d tmp
```
从远程获取最新的版本到本地的tmp分支上
之后再进行比较合并
```
git pull origin master
```
