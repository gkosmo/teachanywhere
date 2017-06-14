var Attend = React.createClass({
  getInitialState: function() {
    return {  event: this.props.event
    }
  },
  render: function() {
    var divClasses = classNames({
     "btn-success": this.state.event.attended,
     "event-attended": this.state.event.attended
    });
    var divAttend = classNames({
      "btn-warning": this.state.event.attended
    });
    return (
       <div>
        <div className="btn {divAttend}" onClick={this.handleClick}>Attend/div>
      </div>
      );
    },
    handleClick: function() {
      var that = this;
      $.ajax({
        type: 'POST',
        url: Routes.course_event_attendances_path({course_id: this.props.event.course, event_id: this.props.event.id, format: 'json'}),
        success: function(data) {
          that.setState({ product: data });
        }
      });
    }

  });
