$(document).on 'click', '#post-like', (e) ->
  $this = $(this)
  $count = $this.parent().children('#post-likes-count').html()
  $id = $(this).data('id')
  $.ajax({
    url: '/posts/' + $id + '/like',
    dataType: 'json'
  }).done (data) ->
    $this.html('unlike').attr('id', 'post-unlike')
    $this.parent().children('#post-likes-count').html(parseInt($count) + 1)

$(document).on 'click', '#post-unlike', (e) ->
  $this = $(this)
  $count = $this.parent().children('#post-likes-count').html()
  $id = $(this).data('id')
  $.ajax({
    url: '/posts/' + $id + '/unlike',
    dataType: 'json'
  }).done (data) ->
    $this.html('like').attr('id', 'post-like')
    $this.parent().children('#post-likes-count').html(parseInt($count) - 1)

$(document).on 'click', '#comment-like', (e) ->
  $this = $(this)
  $count = $this.parent().children('#post-likes-count').html()
  $id = $(this).data('id')
  $.ajax({
    url: '/comments/' + $id + '/like',
    dataType: 'json'
  }).done (data) ->
    console.log($id)
    $this.html('unlike').attr('id', 'comment-unlike')
    $this.parent().children('#comment-likes-count').html(parseInt($count) + 1)

$(document).on 'click', '#comment-unlike', (e) ->
  $this = $(this)
  $count = $this.parent().children('#comment-likes-count').html()
  $id = $(this).data('id')
  $.ajax({
    url: '/comments/' + $id + '/unlike',
    dataType: 'json'
  }).done (data) ->
    $this.html('like').attr('id', 'comment-like')
    $this.parent().children('#comment-likes-count').html(parseInt($count) - 1)