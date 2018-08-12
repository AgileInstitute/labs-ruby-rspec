class WebGadget
  # UserInterface = function(commandName, commandParameter, target) {
#     this.commandName = commandName;
#     this.commandParameter = commandParameter;
#     this.target = target;
# };
#
# UserInterface.prototype = {

  def write_line(message)
#     writeLine: function(message) {
#         var paragraph = $("<p></p>");
#         paragraph.text(message);
#         $("#dialogue").append(paragraph);
#     },
  end

  def parameter(parameter_name)
#     parameter: function (parameterName) {
#         if(parameterName === "command") {
#             return this.commandName;
#         }
#         return this.commandParameter;
#     },
#     variable: function(variableName) {
#         if(variableName === "target") {
#             return this.target;
#         }
#         throw "Unknown variable " + variableName;
#     }
# };
  end
end
