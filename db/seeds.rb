# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
User.create(name: "甲田 守男", email: "CMbyN@test.com", password: "pAGDAiRZ")
User.create(name: "新美 敏哉", email: "YYaTg@test.net", password: "ULGMAnCV")
User.create(name: "東野 竹志", email: "fb6qwr1I0p@sample.com", password: "oEQH49DJ")
User.create(name: "城間 眞", email: "t84Ld7Qgxi@sample.co.jp", password: "rw52ivhv")
User.create(name: "細見 彰", email: "sdSmwpcXg@test.jp", password: "VGNYoAtn")
User.create(name: "篠原 彦太郎", email: "koXCAMg_dT@sample.jp", password: "yPoS87n4")
User.create(name: "新谷 蓮", email: "vzlYs@example.net", password: "cVqcFUyW")
User.create(name: "須山 龍雄", email: "xMFa5@sample.com", password: "x63mQBJt")
User.create(name: "熊沢 昌幸", email: "VpmeOjGqZ@test.co.jp", password: "hxRSf95x")
User.create(name: "神戸 真緒", email: "L2mc2_j@example.jp", password: "TaNIEcbY")

# Event
#2021-06
Event.create(user_id: "1", name: "会議", place: "第1会議室", detail: "営業部内の新規顧客に関する会議", remarks: "資料担当は新美さん",
             start_time: "2021-06-02 11:00:00", end_time: "2021-06-02 12:00:00", release: true, id: "1")
Event.create(user_id: "1", name: "会議", place: "第1会議室", detail: "営業ルートに関する会議", remarks: "資料担当は東野さん",
             start_time: "2021-06-04 11:00:00", end_time: "2021-06-04 12:00:00", release: true, id: "2")
Event.create(user_id: "1", name: "第2営業所視察", place: "第2営業所", detail: "午後には営業ルートの視察も入る", remarks: "お客様と会う可能性あり",
             start_time: "2021-06-07 10:00:00", end_time: "2021-06-07 17:00:00", release: true, id: "3")
Event.create(user_id: "1", name: "大阪出張", place: "大阪事務所", detail: "お客様との対談、工場視察", remarks: "ホテルチェックイン15:00",
             start_time: "2021-06-08 9:00:00", end_time: "2021-06-11 17:00:00", release: true, id: "4")
Event.create(user_id: "1", name: "報告会", place: "第3会議室", detail: "5月の進捗状況報告", remarks: "副社長参加",
             start_time: "2021-06-14 10:30:00", end_time: "2021-06-14 12:00:00", release: true, id: "5")
Event.create(user_id: "1", name: "原料メーカーとの打ち合わせ", place: "第2会議室", detail: "原価調整・新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-06-14 14:00:00", end_time: "2021-06-14 15:30:00", release: true, id: "6")
Event.create(user_id: "1", name: "工場設備点検", place: "第1工場", detail: "定期点検", remarks: "点検後ハンコ必要。工場内は小物の持ち込み禁止なので、最後に持っていく。",
             start_time: "2021-06-15 9:00:00", end_time: "2021-06-15 17:30:00", release: true, id: "7")
Event.create(user_id: "1", name: "原料メーカーとの打ち合わせ", place: "第3会議室", detail: "新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-06-16 10:30:00", end_time: "2021-06-16 12:00:00", release: true, id: "8")
Event.create(user_id: "1", name: "第2四半期経営計画会議", place: "第3会議室", detail: "新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-06-16 13:30:00", end_time: "2021-06-16 17:00:00", release: true, id: "9")
Event.create(user_id: "1", name: "お客様挨拶", place: "荒川化成品工業", detail: "半年に一度のお客様挨拶", remarks: "会社から出るときに菓子折りを持参",
             start_time: "2021-06-17 10:00:00", end_time: "2021-06-17 12:00:00", release: true, id: "10")
Event.create(user_id: "1", name: "お客様意見書作成", place: "", detail: "同日のお客様挨拶の際の意見まとめ", remarks: "一応締め切りは6/18",
             start_time: "2021-06-17 16:00:00", end_time: "2021-06-17 17:00:00", release: true, id: "11")
Event.create(user_id: "1", name: "研究所安全点検", place: "第1・2研究所", detail: "月一の安全点検", remarks: "",
             start_time: "2021-06-18 9:00:00", end_time: "2021-06-18 11:00:00", release: true, id: "12")
Event.create(user_id: "1", name: "新規顧客会議", place: "第2会議室", detail: "新規の顧客による営業ルートとリモートでの環境作りの会議", remarks: "",
             start_time: "2021-06-18 13:00:00", end_time: "2021-06-18 15:00:00", release: true, id: "13")
Event.create(user_id: "1", name: "北海道出張", place: "北海道事務所", detail: "お客様との対談、工場視察", remarks: "ホテルチェックイン16:00",
             start_time: "2021-06-21 9:00:00", end_time: "2021-06-25 17:00:00", release: true, id: "14")
Event.create(user_id: "1", name: "新商品サンプル打ち合わせ", place: "第3会議室", detail: "新規事業の商品サンプルがくる", remarks: "副社長参加",
             start_time: "2021-06-28 10:30:00", end_time: "2021-06-28 12:00:00", release: true, id: "15")
Event.create(user_id: "1", name: "新商品サンプル報告書", place: "第3会議室", detail: "締め切りは6/29", remarks: "",
             start_time: "2021-06-28 16:30:00", end_time: "2021-06-28 17:30:00", release: true, id: "16")
Event.create(user_id: "1", name: "リモート環境構築打ち合わせ", place: "第3会議室", detail: "セキュリティー報告", remarks: "社長参加",
             start_time: "2021-06-29 10:30:00", end_time: "2021-06-29 12:00:00", release: true, id: "17")
Event.create(user_id: "1", name: "リモート環境構築の修正", place: "", detail: "午前の打ち合わせの内容を修正", remarks: "",
             start_time: "2021-06-29 13:30:00", end_time: "2021-06-29 17:00:00", release: true, id: "18")
Event.create(user_id: "1", name: "リモート環境説明会", place: "第3会議室", detail: "4回に分けて各部署に説明", remarks: "東野さんと城間さんも参加",
             start_time: "2021-06-29 9:30:00", end_time: "2021-06-29 16:30:00", release: true, id: "19")
Event.create(user_id: "1", name: "買い出し", place: "", detail: "", remarks: "",
             start_time: "2021-06-05 11:00:00", end_time: "2021-06-05 12:00:00", release: false, id: "20")
Event.create(user_id: "1", name: "リモート飲み会", place: "", detail: "", remarks: "",
             start_time: "2021-06-05 20:00:00", end_time: "2021-06-05 23:00:00", release: false, id: "21")
Event.create(user_id: "1", name: "リモート飲み会", place: "", detail: "", remarks: "",
             start_time: "2021-06-20 20:00:00", end_time: "2021-06-20 23:00:00", release: false, id: "22")
#2021-07
Event.create(user_id: "1", name: "会議", place: "第1会議室", detail: "営業部内の新規顧客に関する会議", remarks: "資料担当は新美さん",
             start_time: "2021-07-01 11:00:00", end_time: "2021-07-01 12:00:00", release: true, id: "23")
Event.create(user_id: "1", name: "会議", place: "第1会議室", detail: "営業ルートに関する会議", remarks: "資料担当は東野さん",
             start_time: "2021-07-02 11:00:00", end_time: "2021-07-02 12:00:00", release: true, id: "24")
Event.create(user_id: "1", name: "第2営業所視察", place: "第2営業所", detail: "午後には営業ルートの視察も入る", remarks: "お客様と会う可能性あり",
             start_time: "2021-07-05 10:00:00", end_time: "2021-07-05 17:00:00", release: true, id: "25")
Event.create(user_id: "1", name: "大阪出張", place: "大阪事務所", detail: "お客様との対談、工場視察", remarks: "ホテルチェックイン15:00",
             start_time: "2021-07-06 9:00:00", end_time: "2021-07-9 17:00:00", release: true, id: "26")
Event.create(user_id: "1", name: "報告会", place: "第3会議室", detail: "5月の進捗状況報告", remarks: "副社長参加",
             start_time: "2021-07-12 10:30:00", end_time: "2021-07-12 12:00:00", release: true, id: "27")
Event.create(user_id: "1", name: "原料メーカーとの打ち合わせ", place: "第2会議室", detail: "原価調整・新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-07-12 14:00:00", end_time: "2021-07-12 15:30:00", release: true, id: "28")
Event.create(user_id: "1", name: "工場設備点検", place: "第1工場", detail: "定期点検", remarks: "点検後ハンコ必要。工場内は小物の持ち込み禁止なので、最後に持っていく。",
             start_time: "2021-07-13 9:00:00", end_time: "2021-07-13 17:30:00", release: true, id: "29")
Event.create(user_id: "1", name: "原料メーカーとの打ち合わせ", place: "第3会議室", detail: "新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-07-14 10:30:00", end_time: "2021-07-14 12:00:00", release: true, id: "30")
Event.create(user_id: "1", name: "第2四半期経営計画会議", place: "第3会議室", detail: "新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-07-14 13:30:00", end_time: "2021-07-14 17:00:00", release: true, id: "31")
Event.create(user_id: "1", name: "お客様挨拶", place: "荒川化成品工業", detail: "半年に一度のお客様挨拶", remarks: "会社から出るときに菓子折りを持参",
             start_time: "2021-07-15 10:00:00", end_time: "2021-07-15 12:00:00", release: true, id: "32")
Event.create(user_id: "1", name: "お客様意見書作成", place: "", detail: "同日のお客様挨拶の際の意見まとめ", remarks: "一応締め切りは6/18",
             start_time: "2021-07-15 16:00:00", end_time: "2021-07-15 17:00:00", release: true, id: "33")
Event.create(user_id: "1", name: "研究所安全点検", place: "第1・2研究所", detail: "月一の安全点検", remarks: "",
             start_time: "2021-07-16 9:00:00", end_time: "2021-07-16 11:00:00", release: true, id: "34")
Event.create(user_id: "1", name: "新規顧客会議", place: "第2会議室", detail: "新規の顧客による営業ルートとリモートでの環境作りの会議", remarks: "",
             start_time: "2021-07-16 13:00:00", end_time: "2021-07-16 15:00:00", release: true, id: "35")
Event.create(user_id: "1", name: "北海道出張", place: "北海道事務所", detail: "お客様との対談、工場視察", remarks: "ホテルチェックイン16:00",
             start_time: "2021-07-19 9:00:00", end_time: "2021-07-23 17:00:00", release: true, id: "36")
Event.create(user_id: "1", name: "新商品サンプル打ち合わせ", place: "第3会議室", detail: "新規事業の商品サンプルがくる", remarks: "副社長参加",
             start_time: "2021-07-26 10:30:00", end_time: "2021-07-26 12:00:00", release: true, id: "37")
Event.create(user_id: "1", name: "新商品サンプル報告書", place: "第3会議室", detail: "締め切りは6/29", remarks: "",
             start_time: "2021-07-26 16:30:00", end_time: "2021-07-26 17:30:00", release: true, id: "38")
Event.create(user_id: "1", name: "リモート環境構築打ち合わせ", place: "第3会議室", detail: "セキュリティー報告", remarks: "社長参加",
             start_time: "2021-07-27 10:30:00", end_time: "2021-07-27 12:00:00", release: true, id: "39")
Event.create(user_id: "1", name: "リモート環境構築の修正", place: "", detail: "午前の打ち合わせの内容を修正", remarks: "",
             start_time: "2021-07-27 13:30:00", end_time: "2021-07-27 17:00:00", release: true, id: "40")
Event.create(user_id: "1", name: "リモート環境説明会", place: "第3会議室", detail: "4回に分けて各部署に説明", remarks: "東野さんと城間さんも参加",
             start_time: "2021-07-29 9:30:00", end_time: "2021-07-29 16:30:00", release: true, id: "41")
Event.create(user_id: "1", name: "買い出し", place: "", detail: "", remarks: "",
             start_time: "2021-07-03 11:00:00", end_time: "2021-07-03 12:00:00", release: false, id: "42")
Event.create(user_id: "1", name: "リモート飲み会", place: "", detail: "", remarks: "",
             start_time: "2021-07-03 20:00:00", end_time: "2021-07-03 23:00:00", release: false, id: "43")
Event.create(user_id: "1", name: "リモート飲み会", place: "", detail: "", remarks: "",
             start_time: "2021-07-17 20:00:00", end_time: "2021-07-17 23:00:00", release: false, id: "44")
#2021-08
Event.create(user_id: "1", name: "会議", place: "第1会議室", detail: "営業部内の新規顧客に関する会議", remarks: "資料担当は新美さん",
             start_time: "2021-08-02 11:00:00", end_time: "2021-08-02 12:00:00", release: true, id: "45")
Event.create(user_id: "1", name: "会議", place: "第1会議室", detail: "営業ルートに関する会議", remarks: "資料担当は東野さん",
             start_time: "2021-08-03 11:00:00", end_time: "2021-08-03 12:00:00", release: true, id: "46")
Event.create(user_id: "1", name: "第2営業所視察", place: "第2営業所", detail: "午後には営業ルートの視察も入る", remarks: "お客様と会う可能性あり",
             start_time: "2021-08-04 10:00:00", end_time: "2021-08-04 17:00:00", release: true, id: "47")
Event.create(user_id: "1", name: "大阪出張", place: "大阪事務所", detail: "お客様との対談、工場視察", remarks: "ホテルチェックイン15:00",
             start_time: "2021-08-05 9:00:00", end_time: "2021-08-06 17:00:00", release: true, id: "48")
Event.create(user_id: "1", name: "報告会", place: "第3会議室", detail: "5月の進捗状況報告", remarks: "副社長参加",
             start_time: "2021-08-09 10:30:00", end_time: "2021-08-09 12:00:00", release: true, id: "49")
Event.create(user_id: "1", name: "原料メーカーとの打ち合わせ", place: "第2会議室", detail: "原価調整・新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-08-09 14:00:00", end_time: "2021-08-09 15:30:00", release: true, id: "50")
Event.create(user_id: "1", name: "工場設備点検", place: "第1工場", detail: "定期点検", remarks: "点検後ハンコ必要。工場内は小物の持ち込み禁止なので、最後に持っていく。",
             start_time: "2021-08-10 9:00:00", end_time: "2021-08-10 17:30:00", release: true, id: "51")
Event.create(user_id: "1", name: "原料メーカーとの打ち合わせ", place: "第3会議室", detail: "新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-08-11 10:30:00", end_time: "2021-08-11 12:00:00", release: true, id: "52")
Event.create(user_id: "1", name: "第2四半期経営計画会議", place: "第3会議室", detail: "新規原料サンプル", remarks: "研究課も参加",
             start_time: "2021-08-12 13:30:00", end_time: "2021-08-12 17:00:00", release: true, id: "53")
Event.create(user_id: "1", name: "お客様挨拶", place: "荒川化成品工業", detail: "半年に一度のお客様挨拶", remarks: "会社から出るときに菓子折りを持参",
             start_time: "2021-08-13 10:00:00", end_time: "2021-08-13 12:00:00", release: true, id: "54")
Event.create(user_id: "1", name: "お客様意見書作成", place: "", detail: "同日のお客様挨拶の際の意見まとめ", remarks: "一応締め切りは6/18",
             start_time: "2021-08-13 16:00:00", end_time: "2021-08-13 17:00:00", release: true, id: "55")
Event.create(user_id: "1", name: "研究所安全点検", place: "第1・2研究所", detail: "月一の安全点検", remarks: "",
             start_time: "2021-08-16 9:00:00", end_time: "2021-08-16 11:00:00", release: true, id: "56")
Event.create(user_id: "1", name: "新規顧客会議", place: "第2会議室", detail: "新規の顧客による営業ルートとリモートでの環境作りの会議", remarks: "",
             start_time: "2021-08-16 13:00:00", end_time: "2021-08-16 15:00:00", release: true, id: "57")
Event.create(user_id: "1", name: "北海道出張", place: "北海道事務所", detail: "お客様との対談、工場視察", remarks: "ホテルチェックイン16:00",
             start_time: "2021-08-17 9:00:00", end_time: "2021-08-20 17:00:00", release: true, id: "58")
Event.create(user_id: "1", name: "新商品サンプル打ち合わせ", place: "第3会議室", detail: "新規事業の商品サンプルがくる", remarks: "副社長参加",
             start_time: "2021-08-23 10:30:00", end_time: "2021-08-23 12:00:00", release: true, id: "59")
Event.create(user_id: "1", name: "新商品サンプル報告書", place: "第3会議室", detail: "締め切りは6/29", remarks: "",
             start_time: "2021-08-23 16:30:00", end_time: "2021-08-23 17:30:00", release: true, id: "60")
Event.create(user_id: "1", name: "リモート環境構築打ち合わせ", place: "第3会議室", detail: "セキュリティー報告", remarks: "社長参加",
             start_time: "2021-08-24 10:30:00", end_time: "2021-08-24 12:00:00", release: true, id: "61")
Event.create(user_id: "1", name: "リモート環境構築の修正", place: "", detail: "午前の打ち合わせの内容を修正", remarks: "",
             start_time: "2021-08-24 13:30:00", end_time: "2021-08-24 17:00:00", release: true, id: "62")
Event.create(user_id: "1", name: "リモート環境説明会", place: "第3会議室", detail: "4回に分けて各部署に説明", remarks: "東野さんと城間さんも参加",
             start_time: "2021-08-25 9:30:00", end_time: "2021-08-25 16:30:00", release: true, id: "63")
Event.create(user_id: "1", name: "買い出し", place: "", detail: "", remarks: "",
             start_time: "2021-08-01 11:00:00", end_time: "2021-08-01 12:00:00", release: false, id: "64")
Event.create(user_id: "1", name: "リモート飲み会", place: "", detail: "", remarks: "",
             start_time: "2021-08-07 20:00:00", end_time: "2021-08-07 23:00:00", release: false, id: "65")
Event.create(user_id: "1", name: "リモート飲み会", place: "", detail: "", remarks: "",
             start_time: "2021-08-21 20:00:00", end_time: "2021-08-21 23:00:00", release: false, id: "66")

# Group
Group.create(name: "営業部", id: "1")
# GroupUser
GroupUser.create(group_id: "1", user_id: "1", invitation: true)
GroupUser.create(group_id: "1", user_id: "2", invitation: true)
GroupUser.create(group_id: "1", user_id: "3", invitation: true)
GroupUser.create(group_id: "1", user_id: "4", invitation: true)
GroupUser.create(group_id: "1", user_id: "5", invitation: true)

# Tag
Tag.create(name: "仕事", id: "1")
Tag.create(name: "プライベート", id: "2")
Tag.create(name: "出張", id: "3")
Tag.create(name: "社外", id: "4")
# TagRelationship
TagRelationship.create(event_id: "1", tag_id: "1")
TagRelationship.create(event_id: "2", tag_id: "1")
TagRelationship.create(event_id: "3", tag_id: "1")
TagRelationship.create(event_id: "4", tag_id: "1")
TagRelationship.create(event_id: "5", tag_id: "1")
TagRelationship.create(event_id: "6", tag_id: "1")
TagRelationship.create(event_id: "7", tag_id: "1")
TagRelationship.create(event_id: "8", tag_id: "1")
TagRelationship.create(event_id: "9", tag_id: "1")
TagRelationship.create(event_id: "10", tag_id: "1")
TagRelationship.create(event_id: "12", tag_id: "1")
TagRelationship.create(event_id: "12", tag_id: "1")
TagRelationship.create(event_id: "13", tag_id: "1")
TagRelationship.create(event_id: "14", tag_id: "1")
TagRelationship.create(event_id: "15", tag_id: "1")
TagRelationship.create(event_id: "16", tag_id: "1")
TagRelationship.create(event_id: "17", tag_id: "1")
TagRelationship.create(event_id: "18", tag_id: "1")
TagRelationship.create(event_id: "19", tag_id: "1")
TagRelationship.create(event_id: "23", tag_id: "1")
TagRelationship.create(event_id: "24", tag_id: "1")
TagRelationship.create(event_id: "25", tag_id: "1")
TagRelationship.create(event_id: "26", tag_id: "1")
TagRelationship.create(event_id: "27", tag_id: "1")
TagRelationship.create(event_id: "28", tag_id: "1")
TagRelationship.create(event_id: "29", tag_id: "1")
TagRelationship.create(event_id: "30", tag_id: "1")
TagRelationship.create(event_id: "31", tag_id: "1")
TagRelationship.create(event_id: "32", tag_id: "1")
TagRelationship.create(event_id: "33", tag_id: "1")
TagRelationship.create(event_id: "34", tag_id: "1")
TagRelationship.create(event_id: "35", tag_id: "1")
TagRelationship.create(event_id: "36", tag_id: "1")
TagRelationship.create(event_id: "37", tag_id: "1")
TagRelationship.create(event_id: "38", tag_id: "1")
TagRelationship.create(event_id: "39", tag_id: "1")
TagRelationship.create(event_id: "40", tag_id: "1")
TagRelationship.create(event_id: "41", tag_id: "1")
TagRelationship.create(event_id: "45", tag_id: "1")
TagRelationship.create(event_id: "46", tag_id: "1")
TagRelationship.create(event_id: "47", tag_id: "1")
TagRelationship.create(event_id: "48", tag_id: "1")
TagRelationship.create(event_id: "49", tag_id: "1")
TagRelationship.create(event_id: "50", tag_id: "1")
TagRelationship.create(event_id: "51", tag_id: "1")
TagRelationship.create(event_id: "52", tag_id: "1")
TagRelationship.create(event_id: "53", tag_id: "1")
TagRelationship.create(event_id: "54", tag_id: "1")
TagRelationship.create(event_id: "55", tag_id: "1")
TagRelationship.create(event_id: "56", tag_id: "1")
TagRelationship.create(event_id: "57", tag_id: "1")
TagRelationship.create(event_id: "58", tag_id: "1")
TagRelationship.create(event_id: "59", tag_id: "1")
TagRelationship.create(event_id: "60", tag_id: "1")
TagRelationship.create(event_id: "61", tag_id: "1")
TagRelationship.create(event_id: "62", tag_id: "1")
TagRelationship.create(event_id: "63", tag_id: "1")
TagRelationship.create(event_id: "20", tag_id: "2")
TagRelationship.create(event_id: "21", tag_id: "2")
TagRelationship.create(event_id: "22", tag_id: "2")
TagRelationship.create(event_id: "42", tag_id: "2")
TagRelationship.create(event_id: "43", tag_id: "2")
TagRelationship.create(event_id: "44", tag_id: "2")
TagRelationship.create(event_id: "64", tag_id: "2")
TagRelationship.create(event_id: "65", tag_id: "2")
TagRelationship.create(event_id: "66", tag_id: "2")
TagRelationship.create(event_id: "4", tag_id: "3")
TagRelationship.create(event_id: "14", tag_id: "3")
TagRelationship.create(event_id: "26", tag_id: "3")
TagRelationship.create(event_id: "36", tag_id: "3")
TagRelationship.create(event_id: "48", tag_id: "3")
TagRelationship.create(event_id: "58", tag_id: "3")
TagRelationship.create(event_id: "3", tag_id: "4")
TagRelationship.create(event_id: "10", tag_id: "4")
TagRelationship.create(event_id: "14", tag_id: "4")
TagRelationship.create(event_id: "25", tag_id: "4")
TagRelationship.create(event_id: "32", tag_id: "4")
TagRelationship.create(event_id: "36", tag_id: "4")
TagRelationship.create(event_id: "47", tag_id: "4")
TagRelationship.create(event_id: "54", tag_id: "4")
TagRelationship.create(event_id: "58", tag_id: "4")
