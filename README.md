[アプリケーション名]  book_stock

[アプリケーション概要]
本を中心としたフリマアプリを目指しました。より多く、種類に分けて検索できるようにしました。
またより良く利便性を図るため検索機能、コメント機能も実装しました。

[URL]   https://book-stock-34988.herokuapp.com/

[テスト用アカウント]

user_name: test1
email: test@test1
password: feafeafea1

user_name: test2
email: test@test2
password: feafeafea2

[利用方法]

ログインしていただき商品を登録していただいたり、出されている商品にコメントをつけたりすることができる。

[目指した課題解決]

本に特化したフリマアプリです。基本をベースにタイトル検索やコメント機能をつけて利便性の向上を目指しました。

[洗い出した要件]

・ユーザー登録機能	ユーザー登録することにより利用できるコンテンツにユーザーと結びつけることができる	nicknameとメールアドレスとパスワードと本名を入力するとユーザー登録できる	どのページからでも新規登録することができる

・本の登録	このアプリでは本の投稿に重きを置いている。フリマに近いアプリなので本の状態を示す欄であったり、ジャンルなどの特有の欄がある。	タイトル名や値段筆者の名前などの重要な欄が多くあり、どれも必須項目である。	ログイン状態のみ利用できる。どのページからでもアクセスできる

・本の編集	手打ち情報を入力するのでどうしてもミスが生まれそれを修正する必要がある。	編集画面では前に入力した情報がそのまま保存されている	一覧画面からその本の投稿者であるなら編集画面に遷移することができる
本の削除	投稿した本の投稿を削除する	一覧画面からログインしている投稿者のみ専用ページに遷移することができる。	一覧画面に遷移するリンクを作る。

・コメント機能	投稿した本に関するリアルな言葉を聞くことができ、また自分からも書き込むことができるので非常に興味深い情報を形成することができる。	ログイン状態のみこのコンテンツを利用することができる。	本の詳細ページにてコメント投稿フォームを作る。また本が削除されると連動してその本で送信されたコメントも削除される。

・・購入機能	PAY.JPを利用した商品購入機能の実装方法を習得	クレジットカードの情報と電話番号を入力すると購入することができる	商品は出品されていることが前提で購入ボタンをクリックしたらDBおよびPAYJPサイトでも更新される。また購入ずみの商品に関してはさいど購入出来ないようにする

[実装した機能についての画像やGIFおよびその説明]	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。
[実装予定の機能]	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。
[データベース設計]	ER図等を添付。
[ローカルでの動作方法]	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。