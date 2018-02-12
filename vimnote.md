##### buffer

```
:ls 显示 buffer 列表
:bn 当前窗口中打开下一个 buffer
:bp 与上相反
CTRL-^ 切换到备用文件

:e! 恢复原始文件
:bd! 强制从缓冲区列表中删除缓冲区，丢弃任何更改
```



##### windows

```
ctrl-w s 水平分割当前窗口，在新窗口中打开相同的文件
ctrl-w v 垂直
:sp[lit] filename
:vsp[lit] filename
:on[ly] 关闭除当前窗口外的全部窗口

ctrl-w w 在打开的窗户之间循环
ctrl-w h 将窗口对准左侧
ctrl-w j 把窗户聚焦在下面
ctrl-w k 把焦点放在最上面
ctrl-w l 把窗户对准右边
```



##### tab

```
:tabe[dit] filename 新选项卡中打开文件
ctrl-W T 将当前拆分窗口移到其自己的选项卡中
:tabo[nly] 关闭除当前标签外的所有标签
gt 移至下一个标签
gT 移至上一个标签
#gt 移至标签#
```


