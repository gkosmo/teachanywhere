var CourseListItem = React.createClass({
  render: function() {
    return (
      <a href={'courses/' + this.props.course.id} >
      <div className="course">
        <div className="course-upvote">Course</div>
        <div className="course-body">
          <h3>{this.props.course.title}
          </h3>
          <p>{this.props.course.content}</p>
        </div>
        <div className="course-controls">

          </div>
      </div>
    </a>
    );
  }
});
