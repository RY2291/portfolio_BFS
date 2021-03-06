# Architecture Facade Share
URL:http://architecture-facade-share.com/

## サイト概要
**街で見かけて気になった建物を共有できるSNS**  
街で見つけた気に入った建築物を自分のお気に入りとして保存ができ、またその建築物について語り合いができます。
また、未知の街では、投稿された物からその街のランドーマークとなる建築物やデザインが凝った建築物を探せるSNSです。

### サイトテーマ
それぞれの街にはランドーマークとなる有名な建築物がありますが、ランドマークになっていないデザインに凝った建築物が多くあります。
建築物が好きなユーザが自分用のコレクションとして保存したり、建築物が好きなユーザが投稿したものを簡単に探す事ができ、
投稿したものを共有できます。
馴染みの少ない街では、気になる建築物と出会えるかは分からないですが、このサイトを利用することにより、建築物が好きなユーザによって投稿された
建築物を知ることができます。


### テーマを選んだ理由
前職でお客様と設計打ち合わせをしている中で、建物のデザインについて非常に悩まれていました。気にいった建築物を見つけることは時間も掛かり、見つけたとしても
様々な建物の写真を撮っていく間に、量も多くなり、探すことに苦労します。
また、打ち合わせで説明される際にも場所などの記憶も薄れていて、地図で見つける事に苦労をしていました。
それを見て、写真、住所、メモを投稿することで後から見返す時に建物情報を保存できるサービスができたらと考えていた為、作成に至りました。

### ターゲットユーザ
* デザインが凝った建築物が好きな人
* 建築物について勉強している人
* 自分のコレクションとして建築物の写真を保存したい方

### 主な利用シーン
* 街で気にいった建築物を見つけて、自分の記録として保存したい時。
* ランドマークになっていない有名建築物以外の建築物を調べたい時。
* 出かけた先で、デザイン性のある建築物を見たい時。

## 実装機能一覧
* ログイン機能・新規登録(devise)
  * 日本語化（devise-i18n）
  * ゲストログイン
*投稿機能
  * 複数画像投稿(refile,refile-mini_magick)
  * 投稿画像スライダー化（slick）
  * 編集
  * 削除
* ユーザ機能
  * 編集
  * 退会(論理削除)
  * いいね（Ajax）
  * コメント（Ajax）
  * 評価(raty.js)
  * フォロー 
*　タグ機能
  * 複数タグ付け
* ソート機能
  * 新しい順、古い順、いいねが多い順、いいねが少ない順
* 地図機能(Google Map API)
  * 投稿されたものを地図上に住所から緯度・経度を取得してマーカー設置(geocoder)
  * マーカーに投稿詳細へのリンク設置
  * 地名、住所検索（Ajax, geocoder）
*　　ページネーション機能（kaminari）
  * 投稿一覧　 
* 管理者機能
  * ユーザの退会（論理削除）
  * 不適切なコメント、投稿の削除

## 設計書
* [画面遷移図](https://drive.google.com/file/d/1I4d5bpURJQPbVXqGRoxjpa7csk7C0kfE/view?usp=sharing)
* [テーブル設計書](https://docs.google.com/spreadsheets/d/1Bj5w3MNhR4FELlw8uFvHRrjN6xEXT140ynu_HUSOsMc/edit#gid=856357510)
* [ER図](https://drive.google.com/file/d/1zTCZrhx1dPHrQj7y7TfJafvEbKx8Idtl/view?usp=sharing)
* [チャレンジ要素](https://docs.google.com/spreadsheets/d/15utyIaRegX0az2SnZkcQ0agFIIjrcn711np0cJyW-5Y/edit#gid=0)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
- 
## 本番環境  
* AWS（EC2、RDS for MySQL、EIP、Route53）
* Nginx、Puma

## 使用素材
- https://pixabay.com/
