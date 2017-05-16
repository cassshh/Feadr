/**
 * Created by Martin on 5/16/2017.
 */

// shortcuts to dom elements.


// Get the post details based on the postID.
// eslint-disable-next-line no-unused-vars
function getPostDetails(postID) {
// eslint-disable-next-line no-undef
    const postDetails = firebase.database().ref('posts/' + postID);
    postDetails.on('value', function(snapshot) {
        console.log(snapshot.val());
    });
}
// eslint-disable-next-line no-unused-vars
function postComment(postPushKey, username, text) {
    // eslint-disable-next-line no-undef
    const commentref = firebase.database().ref('comments/posts/' + postPushKey);
    var newComment = commentref.push();
    newComment.set({
        text: text,
        user: username,
    });
}
/**
 * Example: following method places a comment under the tablename:
 *  postpushkey1 (the post).
 */
// postComment('postpushkey1', 'martin', 'shitposting all day');
