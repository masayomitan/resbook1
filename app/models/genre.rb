class Genre < ActiveHash::Base

  self.data = [
      {id: 1, name: '和食'}, {id: 2, name: '中華'}, {id: 3, name: 'イタリアン'},
      {id: 4, name: 'フレンチ'}, {id: 5, name: 'スペイン料理'}, {id: 6, name: '洋食'},
      {id: 7, name: 'ステーキ'}, {id: 8, name: 'ハンバーガー'}, {id: 9, name: '韓国料理'},
      {id: 10, name: '居酒屋'}, {id: 11, name: 'カフェ'}, {id: 12, name: 'スイーツ'},
      {id: 13, name: 'バー'}, {id: 14, name: 'その他'}
  ]

end