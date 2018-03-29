static char* SMOOTH_BLUR_SCENE_HORIZONTAL_VERTEX_SHADER =
		"attribute vec4 position;    			   												\n"
		"attribute vec2 texcoord;   	   															\n"
		"uniform float texelWidthOffset;	   														\n"
		"uniform float texelHeightOffset;	   													\n"
		"const int GAUSSIAN_SAMPLES = 7;	   													\n"
		"varying vec2 blurCoordinates[GAUSSIAN_SAMPLES];											\n"
		"																						\n"
		"void main(void)               															\n"
		"{                            															\n"
		"   gl_Position = position;  															\n"
		"   							  															\n"
		"   // Calculate the positions for the blur												\n"
		"   vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);					\n"
		"   blurCoordinates[0] = texcoord.xy;													\n"
		"   blurCoordinates[1] = texcoord.xy + singleStepOffset * 1.498702;						\n"
		"   blurCoordinates[2] = texcoord.xy - singleStepOffset * 1.498702;						\n"
		"   blurCoordinates[3] = texcoord.xy + singleStepOffset * 3.496973;						\n"
		"   blurCoordinates[4] = texcoord.xy - singleStepOffset * 3.496973;						\n"
		"   blurCoordinates[5] = texcoord.xy + singleStepOffset * 5.495243;						\n"
		"   blurCoordinates[6] = texcoord.xy - singleStepOffset * 5.495243;						\n"
		"}                            															\n";

//Shader.frag文件内容
static char* SMOOTH_BLUR_SCENE_HORIZONTAL_FRAG_SHADER =
	"precision lowp float;																		\n"
	"uniform sampler2D yuvTexSampler;															\n"
	"uniform highp float texelWidthOffset;														\n"
	"uniform highp float texelHeightOffset;														\n"
	"const lowp int GAUSSIAN_SAMPLES = 7;														\n"
	"varying highp vec2 blurCoordinates[GAUSSIAN_SAMPLES];										\n"
	"																							\n"
	"void main()																					\n"
	"{																							\n"
	"	lowp vec4 sum = vec4(0.0);																\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0]) * 0.024856;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[1]) * 0.049497;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[2]) * 0.049497;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[3]) * 0.048649;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[4]) * 0.048649;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[5]) * 0.047159;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[6]) * 0.047159;											\n"
	"	highp vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);									\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 7.493513) * 0.045086;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 7.493513) * 0.045086;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 9.491782) * 0.042513;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 9.491782) * 0.042513;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 11.490053) * 0.039536;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 11.490053) * 0.039536;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 13.488324) * 0.036262;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 13.488324) * 0.036262;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 15.486594) * 0.032803;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 15.486594) * 0.032803;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 17.484867) * 0.029266;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 17.484867) * 0.029266;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 19.483137) * 0.025752;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 19.483137) * 0.025752;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 21.481409) * 0.022349;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 21.481409) * 0.022349;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 23.479683) * 0.019129;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 23.479683) * 0.019129;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 25.477955) * 0.016148;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 25.477955) * 0.016148;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 27.476229) * 0.013444;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 27.476229) * 0.013444;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 29.474503) * 0.011040;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 29.474503) * 0.011040;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 31.472776) * 0.008941;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 31.472776) * 0.008941;        \n"
	"	gl_FragColor = sum;																						\n"
	"}																											\n";


static char* SMOOTH_BLUR_SCENE_VERTICAL_VERTEX_SHADER =
		"attribute vec4 position;    			   												\n"
		"attribute vec2 texcoord;   	   															\n"
		"uniform float texelWidthOffset;	   														\n"
		"uniform float texelHeightOffset;	   													\n"
		"const int GAUSSIAN_SAMPLES = 7;	   													\n"
		"varying vec2 blurCoordinates[GAUSSIAN_SAMPLES];											\n"
		"																						\n"
		"void main(void)               															\n"
		"{                            															\n"
		"   gl_Position = position;  															\n"
		"   							  															\n"
		"   // Calculate the positions for the blur												\n"
		"   vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);					\n"
		"   blurCoordinates[0] = texcoord.xy;													\n"
		"   blurCoordinates[1] = texcoord.xy + singleStepOffset * 1.498702;						\n"
		"   blurCoordinates[2] = texcoord.xy - singleStepOffset * 1.498702;						\n"
		"   blurCoordinates[3] = texcoord.xy + singleStepOffset * 3.496973;						\n"
		"   blurCoordinates[4] = texcoord.xy - singleStepOffset * 3.496973;						\n"
		"   blurCoordinates[5] = texcoord.xy + singleStepOffset * 5.495243;						\n"
		"   blurCoordinates[6] = texcoord.xy - singleStepOffset * 5.495243;						\n"
		"}                            															\n";


static char* SMOOTH_BLUR_SCENE_VERTICAL_FRAG_SHADER =
	"precision lowp float;																		\n"
	"uniform sampler2D yuvTexSampler;															\n"
	"uniform highp float texelWidthOffset;														\n"
	"uniform highp float texelHeightOffset;														\n"
	"const lowp int GAUSSIAN_SAMPLES = 7;														\n"
	"varying highp vec2 blurCoordinates[GAUSSIAN_SAMPLES];										\n"
	"																							\n"
	"void main()																					\n"
	"{																							\n"
	"	lowp vec4 sum = vec4(0.0);																\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0]) * 0.024856;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[1]) * 0.049497;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[2]) * 0.049497;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[3]) * 0.048649;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[4]) * 0.048649;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[5]) * 0.047159;											\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[6]) * 0.047159;											\n"
	"	highp vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);									\n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 7.493513) * 0.045086;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 7.493513) * 0.045086;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 9.491782) * 0.042513;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 9.491782) * 0.042513;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 11.490053) * 0.039536;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 11.490053) * 0.039536;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 13.488324) * 0.036262;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 13.488324) * 0.036262;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 15.486594) * 0.032803;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 15.486594) * 0.032803;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 17.484867) * 0.029266;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 17.484867) * 0.029266;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 19.483137) * 0.025752;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 19.483137) * 0.025752;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 21.481409) * 0.022349;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 21.481409) * 0.022349;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 23.479683) * 0.019129;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 23.479683) * 0.019129;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 25.477955) * 0.016148;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 25.477955) * 0.016148;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 27.476229) * 0.013444;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 27.476229) * 0.013444;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 29.474503) * 0.011040;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 29.474503) * 0.011040;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] + singleStepOffset * 31.472776) * 0.008941;        \n"
	"	sum += texture2D(yuvTexSampler, blurCoordinates[0] - singleStepOffset * 31.472776) * 0.008941;        \n"
	"	gl_FragColor = sum;																						\n"
	"}																											\n";
