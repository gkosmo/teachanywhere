var Upvote = React.createClass({
  getInitialState: function() {
    return {  course: this.props.course
    }
  },
  render: function() {
    var divClasses = classNames({
      "course-upvote": true,
      "course-upvote-upvoted": this.state.course.up_voted
    });
    return (
      <div className={divClasses} >
        <div className="course-arrow" onClick={this.handleClick}></div>
        <div className="course-count">
            {this.state.course.votes}
        </div>
      </div>
      );
    },
    handleClick: function() {
      var that = this;
      $.ajax({
        type: 'POST',
        url: Routes.upvote_course_path(this.props.course.id, { format: 'json' }),
        success: function(data) {
          that.setState({ product: data });
        }
      });
    }

  });
