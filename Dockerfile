FROM ubuntu:latest

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    meld \
    locales \
    fonts-noto-cjk \
    x11-apps \
    && apt-get clean

# 日本語ロケールの設定
RUN locale-gen ja_JP.UTF-8 && \
    update-locale LANG=ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# meldrcファイルを登録
RUN mkdir -p /root/.config/meld && \
    echo "[ui]\nshow-toolbar=true" > /root/.config/meld/meldrc

# コンテナ内にホストと同じUIDのユーザを作成
ARG UID=1000
RUN useradd -u $UID -m user
USER user

# meldをデフォルトで起動
CMD ["meld"]

