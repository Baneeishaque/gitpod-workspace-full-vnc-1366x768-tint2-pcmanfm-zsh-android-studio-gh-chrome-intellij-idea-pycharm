FROM baneeishaque/gitpod-workspace-full-vnc-1366x768-tint2-pcmanfm-zsh-android-studio-gh-chrome-intellij-idea

ARG pycharmDownloadUrl="https://download.jetbrains.com/python/pycharm-professional-2021.1.1.tar.gz"
ARG pycharmInstallationFile="pycharm-professional-2021.1.1.tar.gz"

RUN cd $HOME \
 && wget $pycharmDownloadUrl | tee -a /tmp/wget-intellijIdea.log \
 && sudo tar -xvf $pycharmInstallationFile -C /usr/local/ | tee -a /tmp/tar-intellijIdea.log\
 && rm $pycharmInstallationFile

RUN mkdir -p ~/.config/JetBrains/PyCharm2021.1 \
 && cp /usr/local/pycharm-2021.1/bin/pycharm64.vmoptions ~/.config/JetBrains/PyCharm2021.1/ \
 && echo "-Dsun.java2d.xrender=false" >> ~/.config/JetBrains/PyCharm2021.1/pycharm64.vmoptions
