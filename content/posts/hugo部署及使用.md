---
title: "Hugo_blog 配置说明"
date: 2019-06-20T12:13:30+08:00
draft: false
Tags:
- Hugo 
Categories:
- Hugo
toc: true
img: "img/blog/hugo-logo-wide.svg"
---

使用Hugo生成静态网页， 并使用github托管<!--more-->

## 下载及配置Hugo

- https://github.com/gohugoio/hugo/releases 根据自己设备选择对应的hugo版本
- 在系统环境变量path中配置下载的exe后的路径

## hugo 使用

### 生成默认组织结构

    hugo new site ./blog                                    //创建网页的文件夹组织结构

huge new site 生成的目录结构如下:

    ├── archetypes
    │   └── default.md
    ├── config.toml
    ├── content
    ├── data
    ├── layouts
    ├── static
    └── themes

- config.toml 是整个网站的配置文件
- archetypes：包括内容类型，在创建新内容时自动生成内容的配置。
- content：包括网站内容，全部使用 markdown 格式。
- layouts：包括了网站的模版，决定内容如何呈现，目录下模板优先级高于 /themes/<THEME>/layouts/，可以用来小规模的定制主题。
- static：包括了 css, js, fonts, media 等，决定网站的外观。  

文件系统里 markdown 文件路径和最后站点 url 的对应关系一般如下：

    └── content
        └── about
        |   └── _index.md  // <- https://example.com/about/
        ├── post
            ├── firstpost.md   // <- https://example.com/post/firstpost/
            ├── happy
            |   └── ness.md  // <- https://example.com/post/happy/ness/
            └── secondpost.md  // <- https://example.com/post/secondpost/

### 下载主题

    cd ./blog/themes
    git clone https://github.com/orianna-zzo/AllinOne       //克隆一个样式，样式git中大部分都有exampleSite， 可以模仿对样式图片等进行设置

### 编写config.toml注意事项

    baseURL = "https://username.github.io"  //静态网页访问的地址
    themes = "AllinOne"                     //最好直接加上， 启动服务的时候不需要在-t指明具体样式
    publishdir = "public"                   // hugo -D 生成静态网页的路径， 默认在public文件夹下
    其他参数根据克隆样式中的例子， 仿照编写

### 启动服务

    hugo server -t=AllinOne                //本地启动服务
    浏览器访问 http://127.0.0.1:1313/       //可以直接查看生成的结果

    hugo -D                                //生成静态网页，一般会在public文件夹下生成

## GitHub 托管静态网页

登录github，创建一个工程， 工程名为 username.github.io(username是github用户名)

将默认的public下的文件提交到此工程下， 即可

    cd public
    git init
    git add .
    git commit -m 'init blog'
    git remote add origin git@github.com:username/username.github.io.git
    git push -u origin master
