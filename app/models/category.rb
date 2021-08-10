class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '雑誌' },
    { id: 3, name: '絵本・児童書' },
    { id: 4, name: 'カレンダー' },
    { id: 5, name: 'タレント写真集' },
    { id: 6, name: 'ビジネス・経済' },
    { id: 7, name: '文学・評論' },
    { id: 8, name: 'コンピューター・IT' },
    { id: 9, name: '医学・薬学・看護学・歯科学' },
    { id: 10, name: '人文・思想' },
    { id: 11, name: '歴史・地理' },
    { id: 12, name: '趣味・実用' },
    { id: 13, name: '科学・テクノロジー' },
    { id: 14, name: '教育・学習参考書' },
    { id: 15, name: '暮らし・健康・子育て' },
    { id: 16, name: '楽譜・スコア・音楽書' },
    { id: 17, name: '投資・金融・会社経営' },
    { id: 18, name: 'ゲーム攻略・ゲームブック' },
    { id: 19, name: '会社・政治' },
    { id: 20, name: 'ノンフィクション' },
    { id: 21, name: 'アート・建築・デザイン' },
    { id: 22, name: '語学・時事典・年鑑' },
    { id: 23, name: '資格・検定・就職' },
    { id: 24, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :books
end