set BASE_DIR=%~dp0   
%BASE_DIR:~0,2%   
cd %BASE_DIR%

cd ./zengsansui.github.io
git fetch
git checkout master
git pull origin master 

cd ../
git fetch
git checkout master
git pull origin master 

git submodule update