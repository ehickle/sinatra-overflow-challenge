

// handler for opening question comment form
function openCommentFormHandler(event) {
  event.preventDefault();
  var that = this;
  $.get($(this).attr("href"))
    .done(function(erb_response) {
      $(that).hide();
      $(that).closest('.comment-div').append(erb_response);
    }
  );
};

// handler for submitting question comment form
function submitCommentFormHandler(event) {
  event.preventDefault();
  var that = this;
  var url  = $(this).attr("action");
  var data = $(this).serialize();
  $.post(url, data)
    .done(function(json) {
    $(that).parent().parent().find('.open-comment-form').show();
      console.log(json);
      
      // build the comment being posted
      var newComment = $(
        '<p class="comment"><a href="/comments/' + 
        json['id'] + 
        '/delete" class="delete">delete</a>' + 
        json['body'] +
        '<br>' +
        '<small class="posted-on">' + 
        json['time_since_creation'] + 
        ' hours ago by ' +
        '<a href="/users/' + 
        json['commenter_id'] + 
        '">' + 
        json['commenter'] + 
        '</a></small></p>');

      console.log(newComment);

      // append the comment
      $(that).parent().find('.comments-only').append(newComment);

      // remove the form from screen
      $(that).remove();
    })
    .fail(function() {
      alert("Comment did not save - make sure it is not empty.");
    });
};


// handler for deleting question comment
function deleteCommentHandler(event) {
  event.preventDefault();
  var that = this;
  var url  = $(this).attr("href");
  $.get(url)
    .done(function() {
      $(that).parent().remove();
    })
    // fail will reload the page
    .fail(function() {
      alert("This comment does not exist anymore - reloading page to update display.")
      window.location.reload();
    });
  };

var bindEvents = function() {

  // open question comment form
  $('body').on("click", ".open-comment-form", openCommentFormHandler);

  // delete question comment
  $('body').on("click", ".delete",deleteCommentHandler);

  // submit question comment form
  $('body').on("submit", '#comment-form', submitCommentFormHandler);
};


$(document).ready(function() {

  bindEvents();

});
