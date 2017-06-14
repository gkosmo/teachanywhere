var EventListItem = React.createClass({
  render: function() {
    return (
      <div className="">
        <div className="course-body">
          <h3> Title: {this.props.event.title}
          </h3>
          <p> Content: {this.props.event.content}</p>
          <p> Date: {this.props.event.date} </p>
          <p> Location: {this.props.event.location}</p>
          <h4>min attendance  for course: {this.props.event.min_attendance} </h4>
          <h4>max attendance  for course: {this.props.event.max_attendance} </h4>
        </div>
  </div>
    );
  }
});
