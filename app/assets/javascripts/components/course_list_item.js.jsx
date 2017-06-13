var CourseListItem = React.createClass({
  render: function() {
    return (
      <div className="course col-sm-6">
      <div className="course-upvote"> <Upvote course={this.props.course} /> </div>

      <a href={'courses/' + this.props.course.id} >
        <div className="course-body">
          <h3>{this.props.course.title}
          </h3>
          <p>{this.props.course.content}</p>
        </div>
          <div className="product-controls">
                <h3> {this.props.course.user.email}</h3>
          </div>
    </a>
  </div>
    );
  }
});
