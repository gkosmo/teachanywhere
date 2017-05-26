var CourseList = React.createClass({
  render: function() {
    return (
      <div>
        {this.props.courses.map(function(course){
          return <CourseListItem course={course} key={course.id} />;
        })}
      </div>
    );
  }
});
