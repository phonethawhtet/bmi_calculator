enum BMIType {
  underweight,
  normal,
  overweight,
  obese,
}

Map<BMIType, List<String>> BMIAdvices = {
  BMIType.underweight: [
    'Eat more calorie-dense foods, such as nuts, seeds, avocados, and nut butters.',
    'Include healthy fats in your diet, such as olive oil, avocado oil, and coconut oil.',
    'Increase your protein intake with foods like meat, poultry, fish, eggs, beans, and tofu.',
    'Try eating smaller, more frequent meals throughout the day to help boost your calorie intake.',
    'Consider working with a healthcare provider or nutritionist to develop a safe and effective plan for gaining weight.',
  ],
  BMIType.normal: [
    'Eat a balanced diet that includes a variety of fruits, vegetables, whole grains, and protein sources.',
    'Get regular physical activity, such as walking, running, swimming, or dancing.',
    'Manage stress through activities like yoga, meditation, or spending time with loved ones.',
    'Keep track of your BMI and weight to ensure they stay within a healthy range.',
    'Consider working with a healthcare provider or nutritionist to develop a plan for maintaining a healthy weight.',
  ],
  BMIType.overweight: [
    'Eat a diet that is rich in fruits, vegetables, and whole grains.',
    'Incorporate physical activity into your daily routine, such as walking, cycling, or lifting weights.',
    'Limit your intake of added sugars and unhealthy fats.',
    'Drink plenty of water and stay hydrated.',
    'Consider working with a healthcare provider or nutritionist to develop a safe and effective weight loss plan.'
  ],
  BMIType.obese: [
    'Eat a diet that is rich in fruits, vegetables, and whole grains, and low in added sugars and unhealthy fats.',
    'Get regular physical activity, such as walking, running, swimming, or dancing.',
    'Make lifestyle changes to support weight loss, such as reducing sedentary behavior and getting enough sleep.',
    'Drink plenty of water and stay hydrated.',
    'Seek support from a healthcare team, including a doctor, nutritionist, and possibly a mental health professional, to develop a comprehensive plan for losing weight and improving your health.',
  ]
};
