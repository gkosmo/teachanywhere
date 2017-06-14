var Attend = React.createClass({
  getInitialState: function() {
    return {  event: this.props.event
    }
  },
  render: function() {
    var divClasses = classNames({
     "label-success": this.state.event.attended,
    });
    return (
       <div className={divClasses}>
        <div className="btn " onClick={this.handleClick}>Attend </div>
      </div>
      );
    },
    handleClick: function() {
      var that = this;
      $.ajax({
        type: 'POST',
        url: Routes.attendance_course_event_path({course_id: this.props.event.course, event_id: this.props.event.id, format: 'json'}),
        success: function(data) {
          that.setState({ event: data });
        }
      });
    }

  });
