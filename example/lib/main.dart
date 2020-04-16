import 'package:cli_dialog/cli_dialog.dart';

dynamic runExample([stdin_service, stdout_service]) {
  if (stdin_service == null) {
    stdin_service = StdinService();
  }
  if (stdout_service == null) {
    stdout_service = StdoutService();
  }

  var questions = [
    ['What name would you like to use for the project?', 'project_name']
  ];
  var booleanQuestions = [
    ['Would you like to add AngularDart routing?', 'routing']
  ];

  var listQuestions = [
    [
      {
        'question': 'Which stylesheet format would you like to use?',
        'options': [
          'CSS',
          'SCSS   [ https://sass-lang.com/documentation/syntax#scss                ]',
          'Sass   [ https://sass-lang.com/documentation/syntax#the-indented-syntax ]',
          'Less   [ http://lesscss.org                                             ]',
          'Stylus [ http://stylus-lang.com                                         ]'
        ]
      },
      'stylesheet'
    ]
  ];

  CLI_Dialog dialog = CLI_Dialog.std(stdin_service, stdout_service,
      questions: questions,
      booleanQuestions: booleanQuestions,
      listQuestions: listQuestions);

  return dialog.ask();
}

String report(answers, {do_print: true}) {
  var output = StringBuffer();
  output.writeln('');
  output.writeln('Your project name is ${answers["project_name"]}.');
  output.writeln(
      'You ' + (answers['routing'] ? '' : 'do not ') + 'want to use routing.');
  output.writeln(
      'Your preferred stylesheet format is ${answers["stylesheet"].split(' ')[0]}.');
  if (do_print) {
    print(output);
  }
  return output.toString();
}

void main() {
  report(runExample());
}
