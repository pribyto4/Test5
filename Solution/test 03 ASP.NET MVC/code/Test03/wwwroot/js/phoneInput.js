document.writeln("<script src='https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js'></script>");

function phoneInput(idPhoneInput,divClassForValid,divClassForError,country){
	var phoneInput = document.querySelector("#"+idPhoneInput);
	const iti = window.intlTelInput(phoneInput, {
		preferredCountries: ["cz"],
		initialCountry: country,
		separateDialCode: true,
		utilsScript:
			"https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js?1638200991544",
	});

	const valid = document.querySelector("."+divClassForValid);
	const error = document.querySelector("."+divClassForError);

	var reset = function () {
		phoneInput.classList.remove("error");
		error.innerHTML = "";
		valid.innerHTML = "";
		error.style.display = "display: none;";
		valid.style.display = "display: none;";
	};

	var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];

	phoneInput.addEventListener('blur', function () {
		reset();
		if (phoneInput.value.trim()) {
			if (iti.isValidNumber()) {
				valid.style.display = "";
				valid.innerHTML = "✓ Valid";
			} else {
				phoneInput.classList.add("error");
				var errorCode = iti.getValidationError();
				error.innerHTML = errorMap[errorCode];
				error.style.display = "";
			}
		}
	});

	phoneInput.addEventListener('change', reset);
	phoneInput.addEventListener('keyup', reset);

    return iti;
}