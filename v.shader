#version 100


attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp float xlv_TEXCOORD6;
void main ()
{
  lowp float tangentSign_1;
  lowp vec3 worldTangent_2;
  lowp vec3 worldNormal_3;
  highp vec2 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  worldNormal_3 = tmpvar_9;
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_2 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_1 = tmpvar_12;
  lowp vec3 tmpvar_13;
  tmpvar_13 = (((worldNormal_3.yzx * worldTangent_2.zxy) - (worldNormal_3.zxy * worldTangent_2.yzx)) * tangentSign_1);
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_2.x;
  tmpvar_14.y = tmpvar_13.x;
  tmpvar_14.z = worldNormal_3.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_2.y;
  tmpvar_15.y = tmpvar_13.y;
  tmpvar_15.z = worldNormal_3.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_2.z;
  tmpvar_16.y = tmpvar_13.z;
  tmpvar_16.z = worldNormal_3.z;
  tmpvar_16.w = tmpvar_7.z;
  mediump vec3 normal_17;
  normal_17 = worldNormal_3;
  mediump vec3 x1_18;
  mediump vec4 tmpvar_19;
  tmpvar_19 = (normal_17.xyzz * normal_17.yzzx);
  x1_18.x = dot (unity_SHBr, tmpvar_19);
  x1_18.y = dot (unity_SHBg, tmpvar_19);
  x1_18.z = dot (unity_SHBb, tmpvar_19);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = (x1_18 + (unity_SHC.xyz * (
    (normal_17.x * normal_17.x)
   - 
    (normal_17.y * normal_17.y)
  )));
  xlv_TEXCOORD5 = tmpvar_4;
  xlv_TEXCOORD6 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}






fff//



#version 100


precision highp float;
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_WorldToShadow[4];
uniform mediump vec4 _LightShadowData;
uniform highp vec4 unity_ShadowFadeCenterAndType;
uniform highp mat4 unity_MatrixV;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _ShadowMapTexture;
uniform sampler2D _MainTex;
uniform sampler2D _BumpMap;
uniform sampler2D _EmissionMap;
uniform lowp vec4 _Color;
uniform lowp vec4 _FlickerColor;
uniform lowp float _FlickerSpeed;
uniform lowp float _ShineIntensity;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD6;
void main ()
{
  mediump float tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  lowp vec3 worldN_4;
  lowp vec4 c_5;
  lowp float atten_6;
  lowp vec3 worldViewDir_7;
  lowp vec3 lightDir_8;
  highp vec3 tmpvar_9;
  tmpvar_9.x = xlv_TEXCOORD1.w;
  tmpvar_9.y = xlv_TEXCOORD2.w;
  tmpvar_9.z = xlv_TEXCOORD3.w;
  mediump vec3 tmpvar_10;
  tmpvar_10 = _WorldSpaceLightPos0.xyz;
  lightDir_8 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((_WorldSpaceCameraPos - tmpvar_9));
  worldViewDir_7 = tmpvar_11;
  lowp vec3 tmpvar_12;
  lowp vec3 tmpvar_13;
  mediump float tmpvar_14;
  lowp float emission_15;
  mediump vec4 matMaskMap_16;
  mediump vec4 bumTex_17;
  mediump vec4 tex_18;
  lowp vec4 tmpvar_19;
  tmpvar_19 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex_18 = tmpvar_19;
  tmpvar_12 = (tex_18.xyz * _Color.xyz);
  lowp vec4 tmpvar_20;
  tmpvar_20 = texture2D (_BumpMap, xlv_TEXCOORD0);
  bumTex_17 = tmpvar_20;
  lowp vec3 tmpvar_21;
  lowp vec4 packednormal_22;
  packednormal_22 = bumTex_17;
  tmpvar_21 = ((packednormal_22.xyz * 2.0) - 1.0);
  lowp vec4 tmpvar_23;
  tmpvar_23 = texture2D (_EmissionMap, xlv_TEXCOORD0);
  matMaskMap_16 = tmpvar_23;
  tmpvar_14 = (1.0 - matMaskMap_16.x);
  highp float tmpvar_24;
  lowp float y_25;
  y_25 = (1.0 - _ShineIntensity);
  tmpvar_24 = min (abs(cos(
    (_Time.y * _FlickerSpeed)
  )), y_25);
  emission_15 = tmpvar_24;
  tmpvar_13 = (((
    (tmpvar_12 * emission_15)
   + 
    ((1.0 - emission_15) * matMaskMap_16.z)
  ) * matMaskMap_16.y) * _FlickerColor.xyz);
  mediump float realtimeShadowAttenuation_26;
  highp vec4 v_27;
  v_27.x = unity_MatrixV[0].z;
  v_27.y = unity_MatrixV[1].z;
  v_27.z = unity_MatrixV[2].z;
  v_27.w = unity_MatrixV[3].z;
  highp vec3 tmpvar_28;
  tmpvar_28 = (tmpvar_9 - unity_ShadowFadeCenterAndType.xyz);
  mediump float tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = clamp (((
    mix (dot ((_WorldSpaceCameraPos - tmpvar_9), v_27.xyz), sqrt(dot (tmpvar_28, tmpvar_28)), unity_ShadowFadeCenterAndType.w)
   * _LightShadowData.z) + _LightShadowData.w), 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  highp vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = tmpvar_9;
  lowp float tmpvar_32;
  highp vec4 shadowCoord_33;
  shadowCoord_33 = (unity_WorldToShadow[0] * tmpvar_31);
  highp float lightShadowDataX_34;
  mediump float tmpvar_35;
  tmpvar_35 = _LightShadowData.x;
  lightShadowDataX_34 = tmpvar_35;
  highp float tmpvar_36;
  tmpvar_36 = max (float((texture2D (_ShadowMapTexture, shadowCoord_33.xy).x > shadowCoord_33.z)), lightShadowDataX_34);
  tmpvar_32 = tmpvar_36;
  realtimeShadowAttenuation_26 = tmpvar_32;
  mediump float tmpvar_37;
  tmpvar_37 = clamp ((realtimeShadowAttenuation_26 + tmpvar_29), 0.0, 1.0);
  atten_6 = tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = dot (xlv_TEXCOORD1.xyz, tmpvar_21);
  worldN_4.x = tmpvar_38;
  highp float tmpvar_39;
  tmpvar_39 = dot (xlv_TEXCOORD2.xyz, tmpvar_21);
  worldN_4.y = tmpvar_39;
  highp float tmpvar_40;
  tmpvar_40 = dot (xlv_TEXCOORD3.xyz, tmpvar_21);
  worldN_4.z = tmpvar_40;
  tmpvar_2 = _LightColor0.xyz;
  tmpvar_3 = lightDir_8;
  tmpvar_1 = atten_6;
  mediump vec3 normalWorld_41;
  normalWorld_41 = worldN_4;
  mediump vec3 tmpvar_42;
  tmpvar_42 = (tmpvar_2 * tmpvar_1);
  mediump vec4 tmpvar_43;
  tmpvar_43.w = 1.0;
  tmpvar_43.xyz = normalWorld_41;
  mediump vec3 x_44;
  x_44.x = dot (unity_SHAr, tmpvar_43);
  x_44.y = dot (unity_SHAg, tmpvar_43);
  x_44.z = dot (unity_SHAb, tmpvar_43);
  mediump vec3 tmpvar_45;
  tmpvar_45 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD4 + x_44)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  tmpvar_2 = tmpvar_42;
  lowp vec4 c_46;
  highp float nh_47;
  lowp vec3 h_48;
  lowp vec4 c_49;
  lowp float diff_50;
  mediump float tmpvar_51;
  tmpvar_51 = max (0.0, dot (worldN_4, tmpvar_3));
  diff_50 = tmpvar_51;
  c_49.xyz = ((tmpvar_12 * tmpvar_42) * diff_50);
  mediump vec3 tmpvar_52;
  mediump vec3 inVec_53;
  inVec_53 = (tmpvar_3 + worldViewDir_7);
  tmpvar_52 = (inVec_53 * inversesqrt(max (0.001, 
    dot (inVec_53, inVec_53)
  )));
  h_48 = tmpvar_52;
  lowp float tmpvar_54;
  tmpvar_54 = max (0.0, dot (worldN_4, h_48));
  nh_47 = tmpvar_54;
  mediump float y_55;
  y_55 = (tmpvar_14 * 128.0);
  highp float tmpvar_56;
  mediump float y_57;
  y_57 = ((1.0 - tmpvar_14) * 1.2);
  tmpvar_56 = min (pow (nh_47, y_55), y_57);
  c_49.xyz = (c_49.xyz + ((tmpvar_42 * _SpecColor.xyz) * tmpvar_56));
  c_49.w = 1.0;
  c_46.xyz = (c_49.xyz + (tmpvar_12 * tmpvar_45));
  c_46.w = 1.0;
  c_5.w = c_46.w;
  c_5.xyz = (c_46.xyz + tmpvar_13);
  highp float tmpvar_58;
  tmpvar_58 = clamp (xlv_TEXCOORD6, 0.0, 1.0);
  c_5.xyz = mix (unity_FogColor.xyz, c_5.xyz, vec3(tmpvar_58));
  gl_FragData[0] = c_5;
}