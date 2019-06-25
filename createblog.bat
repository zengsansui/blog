set BASE_DIR=%~dp0   
%BASE_DIR:~0,2%   
cd %BASE_DIR%

cd ./zengsansui.github.io
rmdir /s /q about
rmdir /s /q posts
rmdir /s /q categories
rmdir /s /q css
rmdir /s /q fonts
rmdir /s /q images
rmdir /s /q img
rmdir /s /q js
rmdir /s /q series
rmdir /s /q tags
del *.html
del *.xml

cd ../
hugo -D

cd ./zengsansui.github.io
git add -A
git commit -m "rebuilding site"
git push --force -u origin master

cd ../
git add -A
git commit -m "rebuilding site"
git push --force -u origin master