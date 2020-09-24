class Question < ActiveHash::Base
  self.data = [
    { id: 1, No: 'Q.1', question: 'HTML,CSSが何なのかわかる' },
    { id: 2, No: 'Q.2', question: 'プログラミングを行う目的は仕事にしたいからだ' },
    { id: 3, No: 'Q.3', question: '得られる効果が高ければ、資金の投資はいとわない' }
  ]
end