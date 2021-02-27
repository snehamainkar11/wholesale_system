function Init() {
    $.ajaxSetup({ cache: false });
};
$(document).ready(function () {
    Ladda.bind('.btn', { timeout: 1000 });
});
function ShowMessage(msg) {
    toastr.success(msg);
}

function ShowMessageError(msg) {
    toastr.error(msg);
}


// Render Actions to open Dialog when onclick
function RenderActions(renderActionstring) {
    $("#OpenDialog").load(renderActionstring);
};
function showError(txt) {
    $("#showError").show();
    var errorTxt = '<strong>Warning! </strong>' + txt;
    $("#ErrorTxt").fadeIn(400).html(errorTxt);
};
function hideError() {
    $("#showError").hide(300);
};
function showLoading(txt) {
    $("#showLoading").show();
    var txtLoading = '<strong>Warning! </strong>' + txt;
    $("#txtLoading").fadeIn(400).html(txtLoading);
};
function hideLoading() {
    $("#showLoading").hide(300);
};
// Clean Form when you need
function Clean() {
    $('#modalUser').find('textarea,input').val('');
};