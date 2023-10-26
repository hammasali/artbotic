class ImageGenerationModel {
  String? key;
  String? prompt;
  String? promptsBuilder;
  String? initImage;
  String? modelId;
  String? modelName;
  String? instancePrompt;
  String? negativePrompt;
  String? exactNprompt;
  String? width;
  String? height;
  int? canvasPos;
  String? samples;
  String? scheduler;
  String? numInferenceSteps;
  String? steps;
  String? safetyChecker;
  String? enhancePrompt;
  double? guidanceScale;
  double? strength;
  String? multiLingual;
  String? panorama;
  String? selfAttention;
  String? upscale;
  String? webhook;
  String? guessMode;
  String? token;
  String? endpoint;
  String? type;
  String? seed;
  String? generationTime;
  List<String>? output;

  ImageGenerationModel({
    required this.prompt,
    this.key = '',
    this.promptsBuilder = '',
    this.initImage,
    required this.modelId,
    required this.modelName,
    this.instancePrompt = '',
    required this.negativePrompt,
    this.exactNprompt = '',
    this.width = '1024',
    this.height = '1024',
    required this.canvasPos,
    this.samples = '4',
    this.scheduler = 'UniPCMultistepScheduler',
    required this.numInferenceSteps,
    required this.steps,
    this.safetyChecker = 'yes',
    this.enhancePrompt = 'no',
    required this.guidanceScale,
    this.strength = 1.0,
    this.multiLingual = 'yes',
    this.panorama = 'no',
    this.selfAttention = 'yes',
    this.upscale = 'no',
    this.webhook = 'https://edecator.com/aiApp/webhook.php',
    this.guessMode = 'no',
    required this.token,
    required this.endpoint,
    this.type = 'a',
    required this.seed,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['prompt'] = prompt;
    map['promptsBuilder'] = promptsBuilder;
    map['init_image'] = initImage;
    map['model_id'] = modelId;
    map['model_name'] = modelName;
    map['instance_prompt'] = instancePrompt;
    map['negative_prompt'] = negativePrompt;
    map['exact_Nprompt'] = exactNprompt;
    map['width'] = width;
    map['height'] = height;
    map['canvasPos'] = canvasPos;
    map['samples'] = samples;
    map['scheduler'] = scheduler;
    map['num_inference_steps'] = numInferenceSteps;
    map['steps'] = steps;
    map['safety_checker'] = safetyChecker;
    map['enhance_prompt'] = enhancePrompt;
    map['guidance_scale'] = guidanceScale;
    map['strength'] = strength;
    map['multi_lingual'] = multiLingual;
    map['panorama'] = panorama;
    map['self_attention'] = selfAttention;
    map['upscale'] = upscale;
    map['webhook'] = webhook;
    map['guess_mode'] = guessMode;
    map['token'] = token;
    map['endpoint'] = endpoint;
    map['type'] = type;
    map['seed'] = seed;
    return map;
  }

  ImageGenerationModel.generatedImages(
      {required this.prompt,
      required this.initImage,
      required this.modelId,
      required this.modelName,
      required this.negativePrompt,
      required this.canvasPos,
      required this.numInferenceSteps,
      required this.steps,
      required this.guidanceScale,
      required this.seed,
      required this.output,
      required this.generationTime});

  Map<String, dynamic> toJsonGeneratedImages() {
    return {
      'prompt': prompt,
      'init_image': initImage,
      'model_id': modelId,
      'model_name': modelName,
      'negative_prompt': negativePrompt,
      'canvasPos': canvasPos,
      'num_inference_steps': numInferenceSteps,
      'steps': steps,
      'guidance_scale': guidanceScale,
      'seed': seed,
      'output': output,
      'generationTime': generationTime,
    };
  }

  factory ImageGenerationModel.fromJson(Map<String, dynamic> json) {
    return ImageGenerationModel.generatedImages(
      prompt: json['prompt'],
      initImage: json['init_image'],
      modelId: json['model_id'],
      modelName: json['model_name'],
      negativePrompt: json['negative_prompt'],
      canvasPos: json['canvasPos'],
      numInferenceSteps: json['num_inference_steps'],
      steps: json['steps'],
      guidanceScale: json['guidance_scale'].toDouble(),
      seed: json['seed'],
      output: json['output'],
      generationTime: json['generationTime'],
    );
  }
}
