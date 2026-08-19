///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final tr = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Doctor Hunt'
	String get doctorHunt => 'Doctor Hunt';

	/// en: 'Find Trusted Doctors'
	String get findTrustedDoctors => 'Find Trusted Doctors';

	/// en: 'Choose Best Doctors'
	String get chooseBestDoctors => 'Choose Best Doctors';

	/// en: 'Easy Appointments'
	String get easyAppointments => 'Easy Appointments';

	/// en: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.'
	String get onboardingDesc => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Get Started'
	String get getStarted => 'Get Started';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Choose your role'
	String get chooseYourRole => 'Choose your role';

	/// en: 'The selected role determines the experience and available features.'
	String get chooseRoleSubTitle => 'The selected role determines the experience and\navailable features.';

	/// en: 'Patient'
	String get patientRoleTitle => 'Patient';

	/// en: 'Find doctors, book appointments, and manage your medical records.'
	String get patientRoleSubtitle => 'Find doctors, book appointments, and manage your medical records.';

	/// en: 'Admin'
	String get adminRoleTitle => 'Admin';

	/// en: 'Manage doctors, appointments, users, and the platform.'
	String get adminRoleSubtitle => 'Manage doctors, appointments, users, and the platform.';

	/// en: 'Continue'
	String get continueText => 'Continue';

	/// en: 'Welcome back'
	String get welcomeBack => 'Welcome back';

	/// en: 'You can search course, apply course and find scholarship for abroad studies'
	String get loginSubTitle => 'You can search course, apply course and find\nscholarship for abroad studies';

	/// en: 'Google'
	String get google => 'Google';

	/// en: 'Facebook'
	String get facebook => 'Facebook';

	/// en: 'Email'
	String get emailHint => 'Email';

	/// en: 'Password'
	String get passwordHint => 'Password';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Forgot password'
	String get forgotPassword => 'Forgot password';

	/// en: 'Don't have an account? '
	String get dontHaveAccount => 'Don\'t have an account? ';

	/// en: 'Join us'
	String get joinUs => 'Join us';

	/// en: 'Join us to start searching'
	String get signUpTitle => 'Join us to start searching';

	/// en: 'You can search course, apply course and find scholarship for abroad studies'
	String get signUpSubTitle => 'You can search course, apply course and find\nscholarship for abroad studies';

	/// en: 'Name'
	String get nameHint => 'Name';

	/// en: 'I agree with the Terms of Service & Privacy Policy'
	String get termsAgreement => 'I agree with the Terms of Service & Privacy Policy';

	/// en: 'Sign up'
	String get signUp => 'Sign up';

	/// en: 'Have an account? '
	String get haveAnAccount => 'Have an account? ';

	/// en: 'Log in'
	String get logIn => 'Log in';

	/// en: 'Hello'
	String get hello => 'Hello';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'doctorHunt' => 'Doctor Hunt',
			'findTrustedDoctors' => 'Find Trusted Doctors',
			'chooseBestDoctors' => 'Choose Best Doctors',
			'easyAppointments' => 'Easy Appointments',
			'onboardingDesc' => 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
			'next' => 'Next',
			'getStarted' => 'Get Started',
			'skip' => 'Skip',
			'chooseYourRole' => 'Choose your role',
			'chooseRoleSubTitle' => 'The selected role determines the experience and\navailable features.',
			'patientRoleTitle' => 'Patient',
			'patientRoleSubtitle' => 'Find doctors, book appointments, and manage your medical records.',
			'adminRoleTitle' => 'Admin',
			'adminRoleSubtitle' => 'Manage doctors, appointments, users, and the platform.',
			'continueText' => 'Continue',
			'welcomeBack' => 'Welcome back',
			'loginSubTitle' => 'You can search course, apply course and find\nscholarship for abroad studies',
			'google' => 'Google',
			'facebook' => 'Facebook',
			'emailHint' => 'Email',
			'passwordHint' => 'Password',
			'login' => 'Login',
			'forgotPassword' => 'Forgot password',
			'dontHaveAccount' => 'Don\'t have an account? ',
			'joinUs' => 'Join us',
			'signUpTitle' => 'Join us to start searching',
			'signUpSubTitle' => 'You can search course, apply course and find\nscholarship for abroad studies',
			'nameHint' => 'Name',
			'termsAgreement' => 'I agree with the Terms of Service & Privacy Policy',
			'signUp' => 'Sign up',
			'haveAnAccount' => 'Have an account? ',
			'logIn' => 'Log in',
			'hello' => 'Hello',
			_ => null,
		};
	}
}
