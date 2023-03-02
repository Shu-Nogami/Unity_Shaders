// shaderの名前
Shader "Unlit/SimpleShader"
{
    // Unityのエディター上で設定できるパラメーター
    // 他のスクリプトからの設定も可能
    Properties
    {
        _Color ("Main Coler", Color) = (1, 1, 1, 1)
    }
    
    // shaderの主な処理を記述
    // SubShaderは基本的に1つのみ
    SubShader
    {
        // 1つのオブジェクトに対して一度で描写する際に使用する
        // 基本的に一つだが、複雑な描写をする際は複数書く
        Pass
        {
            // 開始宣言
            CGPROGRAM

            // 関数宣言
            #pragma vertex vert   // vertex(頂点シェーダー)をvertとする
            #pragma fragment frag // fragment(フラグメントシェーダー)をfragとする

            // 変数宣言
            fixed4 _Color;

            // vert(頂点シェーダー)の情報操作
            float4 vert(float4 vertex : POSITION) : SV_POSITION
            {
                return UnityObjectToClipPos(vertex);
            }

            // frag(フラグメントシェーダー)の情報操作
            fixed4 frag() : SV_Target
            {
                return _Color;
            }

            // 終了宣言
            ENDCG
        }
    }
}
