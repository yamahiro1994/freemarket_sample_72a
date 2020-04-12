// パスワード１回目と２回目が一致しているかを確認するJS
function CheckPassword(confirm){
  var input1 = password.value;
  var input2 = confirm.value;
  if(input1 != input2){
    confirm.setCustomValidity("パスワードが一致しません");
  }else{
    confirm.setCustomValidity('');
  }
}
// 全角カナかどうかをチェックするJS
$("input[name='hoge']").blur(function(){
  if(!$(this).val().match(/^[ァ-ロワヲンー  \r\n\t]*$/)){
  }
});
