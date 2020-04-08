$(function() {
  $(document).on('turbolinks:load', ()=> {
    // 画像用のinputを生成する関数
    const buildFileField = (index)=> {
      const html = `<div data-index="${index}" class="js-file_group">
                      <input class="js-file" type="file"
                      name="product[images_attributes][${index}][src]"
                      id="product_images_attributes_${index}_src"><br>
                      <div class="js-remove">削除</div>
                    </div>`;
      return html;
    }

    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    // 既に使われているindexを除外
    lastIndex = $('.js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);
    $('.hidden-destroy').hide();
    $('#new-main__image-box__frame').on('change', '.js-file', function(e) {
      // fileIndexの先頭の数字を使ってinputを作る
      $('#new-main__image-box__frame').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    });

    $('#new-main__image-box__frame').on('click', '.js-remove', function() {
      const targetIndex = $(this).parent().data('index')
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);
      // 画像入力欄が0個にならないようにしておく
      if ($('.js-file').length == 0) $('#new-main__image-box__frame').append(buildFileField(fileIndex[0]));
    });
  });
}, false);