Template.exercice.helpers({
  "isChecked": function(value, answer) {
    return answer == value ? "selected" : "";
  },
  "getNextExercice": function(currentNumber) {
      var exercice = Exercices.findOne({
        "number": currentNumber + 1
      });

      if (exercice)
        return exercice._id;
      else 
        return "end";
  },
  "nextExerciceExist": function(currentNumber) {
      var exercice = Exercices.findOne({
        "number": currentNumber + 1
      });

      return exercice;
  }
});