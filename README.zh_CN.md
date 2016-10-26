# Perfect-UltimateNaughtsAndCrosses 井字棋游戏程序范例[English](README.md)

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="https://gitter.im/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_2_Git.jpg" alt="Chat on Gitter" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a> 
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="https://gitter.im/PerfectlySoft/Perfect?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge" target="_blank">
        <img src="https://img.shields.io/badge/Gitter-Join%20Chat-brightgreen.svg" alt="Join the chat at https://gitter.im/PerfectlySoft/Perfect">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>

本项目“终极淘气”示范了如何用 Perfect 作为服务器后台制作一个井字棋游戏

## 问题报告

目前我们已经把所有错误报告合并转移到了JIRA上，因此github原有的错误汇报功能不能用于本项目。

您的任何宝贵建意见或建议，或者发现我们的程序有问题，欢迎您在这里告诉我们。 [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1)。

目前问题清单请参考以下链接： [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)


## 关于本项目

本项目是用 Swift 语言开发的一个单人或多人游戏。服务器使用 Perfect 作为后端。项目的主要目的是展示客户端和服务器的代码如何共享。

## 游戏内容

**Ultimate Naughts &amp; Crosses (tic-tac-toe)**

经典的井字棋游戏有两个规则：

* 同时在9个棋盘上开局
* 只有对手下完一步棋后，在对应的棋盘上玩家才能落下自己的棋子

如果其中的一个棋盘不能落子，则玩家还可以在其他棋盘尝试下棋。如果想赢得游戏，玩家必须在同一行或列上连续赢三个棋盘的游戏。

这种方法将一个简答的游戏增加了难度：通过不同的棋盘避免对手赢得太过轻松。

![Start Game](assets/start_game.png) ![You Won](assets/you_won.png)

## 系统综述

这是个游戏程序的原型，为了示范而使用了一些图省事儿的方法，请您在正式发行的（用于生产）的系统中不要这么做：

* 程序中用了 SQLite 作为后台数据库
	* SQLite 用于示范是非常好的数据库，因为不需要安装也不需要做配置工作，所以很简便。但是这种数据库不适合多用户系统
* 数据库记录采用了简单的数字编号
	* 用于区分数据记录，这里采用了自动递增的数字编号。这么做太容易被黑客猜中数值，容易遭受攻击。
* 无用户管理
	* 该系统没有账号密码

也就是说，因为该项目无需配置，因此适合示范项目编译运行。

## 工程创建

项目中还包括了以一个 Xcode 工作空间，包含了一个可以直接执行的 iOS 客户端程序。服务器请使用 SPM 软件包管理器编译。如果希望使用 Xcode 同时调试运行客户端和服务器，请用命令 ```swift package generate-xcodeproj``` 为服务器创建 Xcode 工程并将项目文件增加到当前 Xcode 工作空间中。否则，请用 SPM 命令```swift build```编译服务器，然后执行终端命令 ```.build/debug/UNCServer```。服务器会监听8181端口，而客户端则通过访问该端口```localhost:8181``` 与服务器取得联系。

## 代码共享

该项目的目标是展示如何在服务器和客户机之间共享代码，因为只有这样才能充分展示用 Swift 开发服务器能够为 iOS 前端开发提供多么大的便利。所有共享的代码都在 ```Sources/UNCShared``` 文件夹下面，包含了前后端公用的数据结构和协议，比如用户数据类型、API入口点，以及游戏状态等等一揽子内容。

## API 说明

在这里展示 API 的目的是支持轻巧的、紧凑的服务器荷载。当前用户 id 被设置为 HTTP 的 cookie。数据格式是简单的字符串；而异常处理则是通过 HTTP 状态代码完成的。大多数问题处理是通过返回给客户端一个 400 "Bad request" 代码，并在响应数据体内提供详细的错误说明。更实用的系统应该能够接收复杂的 POST/GET 请求方法，以及以 JSON 格式进行响应，而且必须要进行用户身份验证。

## API 接入点 URI

查看 ```Sources/UNCShared/Endpoint.swift``` 代码可以获得详细的 API 接口清单，在此概述如下：

	* unc/register/{nick} - 创建新玩家
	* unc/start/{playertype} - 与其他玩家或机器人开始一局新游戏
	* unc/game - 从当前活动的棋局中取得指定变量的数据值
	* unc/concede - 当前游戏投降认输
	* unc/status - 获得当前游戏的全部状态
	* unc/move/{bx}/{by}/{x}/{y} - 落子
	* unc/nick/{playerid} - 获得对手名字

服务器将上述程序入口点URL在 ```Sources/UNCServer/Register.swift``` 代码中完成登记注册。

服务器还包括了一个机器人，能够作为玩家对手随机落子。





## 更多内容
关于 Perfect 工程的更多内容，请参考官网 [perfect.org](http://perfect.org).
