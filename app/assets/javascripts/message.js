$(function(){
  function buildHTML(message){
      var image_data = (typeof(message.image) !== "undefined"
      ? message.image.thumb.url
      : ""
      );
      var html = `<ul class="chat-list__content">
                  <li class="member-name">
                    ${message.user_name}
                  </li>
                  <li class="chat-date">
                    ${message.time}
                  </li>
                  <li class="chat-text">
                    ${message.text}
                  </li>
                  <li class="chat-image">
                    <img src = "${image_data}">
                  </li>
                </ul>`
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-list').append(html).animate({
        scrollTop: $('.chat-list')[0].scrollHeight
      }, 'fast');
      $('.withicon').val('')
      $('.fileinput').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
})
