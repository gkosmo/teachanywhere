var EventList = React.createClass({
  render: function() {
    return (
      <div className="col-sm-6">
        {this.props.events.map(function(event){
          return <EventListItem event={event} key={event.id} />;
        })}
      </div>
    );
  }
});
