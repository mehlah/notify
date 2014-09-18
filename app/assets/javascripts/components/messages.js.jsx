/** @jsx React.DOM */
var Message = React.createClass({
  render: function () {
    return (
      <div className="message">
        <p>{this.props.body}</p>
        <hr/>
      </div>
    );
  }
});

var MessageList = React.createClass({
  render: function () {
    var messageNodes = this.props.messages.map(function (message, index) {
      return (
        <Message body={message.body} key={index} />
      );
    });

    return (
      <div className="messageList">{messageNodes}</div>
    );
  }
});

var MessageBox = React.createClass({
  getInitialState: function () {
    return {messages: []};
  },

  componentDidMount: function () {
    this.loadMessagesFromServer();
  },

  loadMessagesFromServer: function () {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function (messages) {
        this.setState({messages: messages});
      }.bind(this),
      error: function (xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  handleMessageSubmit: function(message) {
    var messages = this.state.messages;
    this.setState({messages: messages.concat([message])});
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: {"message": message},
      success: function(data) {
        this.loadMessagesFromServer();
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  render: function () {
    return (
      <div className="messageBox">
        <div id="new-message">
          <MessageForm onMessageSubmit={this.handleMessageSubmit}/>
        </div>
        <div id="sent-messages">
          <h5><i className="icon-paper-plane"></i> Messages envoyés</h5>
          <hr/>
          <MessageList messages={this.state.messages} />
        </div>
      </div>
    );
  }
});

var MessageForm = React.createClass({
  handleSubmit: function() {
    var body = this.refs.body.getDOMNode().value.trim();
    this.props.onMessageSubmit({body: body});
    this.refs.body.getDOMNode().value = '';
    return false;
  },

  render: function() {
    return (
      <form className="messageForm" onSubmit={this.handleSubmit}>
        <textarea id="message_body" placeholder="Dites quelque chose !" ref="body"></textarea>
        <input type="submit" value="Envoyer" className="button small" />
      </form>
    );
  }
});
