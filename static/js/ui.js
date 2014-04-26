
function updateSurvey(idx) {
    var target = document.getElementById("li" + idx);
    //alert("This is frontend - updateSurvey: " + idx);
    document.cookie = "surveyidx=" + idx;

    // Delete the survey from database
    document.getElementById("btnUpdate").click();
}

function deleteSurvey(idx) {
    var target = document.getElementById("li" + idx);
    target.style.display = "none";
    //alert("Tshis is frontend - deleteSurvey: " + idx);
    document.cookie = "surveyidx=" + idx;

    // Delete the survey from database
    document.getElementById("btnDelete").click();
}

function editSurvey(idx) {
    var target = document.getElementById("li" + idx);
    //alert("This is frontend - editSurvey: " + idx);
    document.cookie = "surveyidx=" + idx;

    // Delete the survey from database
    document.getElementById("btnEdit").click();
}

function logout() {
    // Delete the survey from database
    document.getElementById("btnLogout").click();
}